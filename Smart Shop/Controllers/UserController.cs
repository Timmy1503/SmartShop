using BotDetect.Web.Mvc;
using ConnectDb.BLL;
using ConnectDb.EF;
using ConnectDb.ViewModel;
using Facebook;
using Microsoft.Owin.Host.SystemWeb;
using Owin;
using Smart_Shop.Common;
using Smart_Shop.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Mvc;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.IO;
using System.Web.Script.Serialization;

namespace Smart_Shop.Controllers
{
    public class UserController : Controller
    {

        public ActionResult Index()
        {
            if (Request.QueryString["code"] != null)
            {
                GoogleCallback(Request.QueryString["code"].ToString());
            }
            return View();
        }
        // GET: User
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [CaptchaValidationActionFilter("CaptchaCode", "ExampleCaptcha", "Mã xác nhận không đúng!")]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserBLL();
                if (dao.CheckUserName(model.UserName))
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                }
                else if (dao.CheckEmail(model.Email))
                {
                    ModelState.AddModelError("", "Email này đã tồn tại");
                }
                else
                {
                    var user = new User();
                    user.UserName = model.UserName;
                    user.Name = model.Name;
                    user.Password = Encrytor.MD5Hash(model.Password);
                    user.Phone = model.Phone;
                    user.Email = model.Email;
                    user.Address = model.Address;
                    user.CreateDate = DateTime.Now;
                    user.Status = true;
                    
                    var result = dao.Insert(user);
                    if (result > 0)
                    {
                        ViewBag.Success = "Đăng ký thành công";
                        model = new RegisterModel();
                        return Redirect("/");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Đăng ký không thành công");
                    }
                }
            }
            return View(model); /// chua refresh 
        }

        

        [HttpGet]
        public ActionResult Login(string returnUrl)
        {
            ViewData["returnUrl"] = returnUrl;
            return View();
        }
        [HttpPost]
        public ActionResult Login(LoginModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserBLL();
                var result = dao.Login(model.UserName, Encrytor.MD5Hash(model.Password));
                if (result == 1)
                {
                    var user = dao.UserGetByID(model.UserName);
                    var userSession = new UserLogin();
                    userSession.UserName = user.UserName;
                    userSession.UserID = user.UserID;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    returnUrl = string.IsNullOrWhiteSpace(returnUrl) ? "/" : returnUrl;
                    return Redirect(returnUrl);
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản đang bị khoá");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng");
                }
                else
                {
                    ModelState.AddModelError("", "Sai tên tài khoản hoặc mật khẩu");
                }
            }
            return View(model);
        }

        public ActionResult Logout()
        {
            Session[CommonConstants.USER_SESSION] = null;
            return Redirect("/");
        }

        public ActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ForgotPassword(string Email)
        {
            string message = "";
            bool status = false;
            using(SmartShopDbContext db = new SmartShopDbContext())
            {
                var account = db.Users.Where(x => x.Email == Email).FirstOrDefault();
                if(account != null)
                {
                    string resetCode = Guid.NewGuid().ToString();
                    SendVerificationLinkEmail(account.Email, resetCode, "ResetPassword");
                    account.ResetPassword = resetCode;
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.SaveChanges();
                    message = "Liên kết đặt lại mật khẩu đã được gửi đến email của bạn";
                }
                else
                {
                    message = "Không tồn tại Email này";
                }
            }
            ViewBag.Message = message;
            return View();
        }

        public void SendVerificationLinkEmail(string emailID, string activationCode, string emailFor= "/dat-lai-mat-khau")
        {
            var verifyUrl = "/User/" + emailFor + "/"+ activationCode;
            var link = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, verifyUrl);

            var fromEmail = new MailAddress("thuc3849@gmail.com", "Smart Shop");
            var toEmail = new MailAddress(emailID);
            var fromEmailPassword = "toandeptrai123"; // Replace with actual password
            string subject = "";
            string body = "";
            if (emailFor == "/dat-lai-mat-khau")
            {
                subject = "Your account is successfully created!";

                body = "<br/><br/>We are excited to tell you that your Smart Shop account is" +
                   " successfully created. Please click on the below link to verify your account" +
                   " <br/><br/><a href='" + link + "'>" + link + "</a> ";

            }
            else if (emailFor == "ResetPassword")
            {
                subject = "Reset Password";
            body = "Xin chào,<br/><br/> Chúng tôi đã nhận được yêu cầu đặt lại mật khẩu tài khoản của bạn. Vui lòng nhấp vào liên kết dưới đây để thiết lập lại tài khoản của bạn:"
                + "<br/><br/><a href=" + link + ">Reset Password Link </a>";
           }

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromEmail.Address, fromEmailPassword)
            };

            using (var message = new MailMessage(fromEmail, toEmail)
            {
                Subject = subject,
                Body = body,
                IsBodyHtml = true
            })
                smtp.Send(message);
        }
        [HttpGet]
        public ActionResult ResetPassword(string id)
        {
            using(SmartShopDbContext db = new SmartShopDbContext())
            {
                var user = db.Users.Where(x => x.ResetPassword == id).FirstOrDefault();
                if(user != null)
                {
                    ResetPasswordModel model = new ResetPasswordModel();
                    model.ResetCode = id;
                    return View(model);
                }
                else
                {
                    return HttpNotFound();
                }
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ResetPassword(ResetPasswordModel model)
        {
            var message = "";
            
            if (ModelState.IsValid)
            {
                using(SmartShopDbContext db = new SmartShopDbContext())
                {
                    var user = db.Users.Where(x => x.ResetPassword == model.ResetCode).FirstOrDefault();
                    if(user != null)
                    {
                        user.Password = Encrytor.MD5Hash(model.NewPassword);
                        user.ResetPassword = "";
                        db.Configuration.ValidateOnSaveEnabled = false;
                        db.SaveChanges();
                        message = "Mật khẩu mới đã cập nhật thành công, hãy đăng nhập để tiếp tục";
                        
                    }
                }
            }
            else
            {
                message = "Hãy điền mật khẩu mới và xác minh lại mật khẩu của bạn";
            }
            ViewBag.Message = message;
            return View(model);
        }
        
        private Uri RedirectUri
        {
            get
            {
                var uriBuilder = new UriBuilder(Request.Url);
                uriBuilder.Query = null;
                uriBuilder.Fragment = null;
                uriBuilder.Path = Url.Action("FacebookCallback");
                return uriBuilder.Uri;
            }
        }

        public ActionResult LoginFacebook()
        {
            var fb = new FacebookClient();
            var loginUrl = fb.GetLoginUrl(new
            {
                client_id = ConfigurationManager.AppSettings["FbAppId"],
                client_secret = ConfigurationManager.AppSettings["FbAppSecret"],
                redirect_uri = RedirectUri.AbsoluteUri,
                response_type = "code",
                scope = "email"
            });
            return Redirect(loginUrl.AbsoluteUri);
        }

        public ActionResult FacebookCallback(string code)
        {
            var fb = new FacebookClient();
            dynamic result = fb.Post("oauth/access_token", new
            {
                client_id = ConfigurationManager.AppSettings["FbAppId"],
                client_secret = ConfigurationManager.AppSettings["FbAppSecret"],
                redirect_uri = RedirectUri.AbsoluteUri,
                code = code
            });

            var accessToken = result.access_token;
            if (!string.IsNullOrEmpty(accessToken))
            {
                fb.AccessToken = accessToken;
                dynamic me = fb.Get("me?fields=first_name, middle_name, last_name, id, email");
                string email = me.email;
                string userName = me.email;
                string firstname = me.first_name;
                string middlename = me.middle_name;
                string lastname = me.last_name;

                var user = new User();
                user.Email = email;
                user.UserName = email;
                user.Status = true;
                user.Name = firstname + "" + middlename + "" + lastname;
                user.CreateDate = DateTime.Now;
                var resultInsert = new UserBLL().InsertForFacebook(user);
                if (resultInsert > 0)
                {
                    var userSession = new UserLogin();
                    userSession.UserName = user.UserName;
                    userSession.UserID = user.UserID;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                }
            }
            return Redirect("/");
        }

        //public void SignIn(string ReturnUrl = "/", string type = "")
        //{
        //    if (!Request.IsAuthenticated)
        //    {
        //        if (type == "Google")
        //        {
        //            HttpContext.GetOwinContext().Authentication.Challenge(new AuthenticationProperties { RedirectUri = "User/GoogleLoginCallback" }, "Google");
        //        }
        //    }
        //}
        //public ActionResult SignOut()
        //{
        //    HttpContext.GetOwinContext().Authentication.SignOut(CookieAuthenticationDefaults.AuthenticationType);
        //    return Redirect("~/");
        //}

        //[AllowAnonymous]
        //public ActionResult GoogleLoginCallback()
        //{
        //    var claimsPrincipal = HttpContext.User.Identity as ClaimsIdentity;

        //    var loginInfo = GoogleLoginViewModel.GetLoginInfo(claimsPrincipal);
        //    if (loginInfo == null)
        //    {
        //        return RedirectToAction("Index");
        //    }


        //    SmartShopDbContext db = new SmartShopDbContext(); //DbContext
        //    var user = db.Users.FirstOrDefault(x => x.Email == loginInfo.emailaddress);

        //    if (user == null)
        //    {
        //        user = new User
        //        {
        //            Email = loginInfo.emailaddress,
        //            UserName = loginInfo.givenname,
        //            Password = loginInfo.nameidentifier,
        //            Name = loginInfo.name,
        //            Address = loginInfo.surname,
        //            Status = true
        //        };
        //        db.Users.Add(user);
        //        db.SaveChanges();
        //    }

        //    var ident = new ClaimsIdentity(
        //            new[] { 
        //	// adding following 2 claim just for supporting default antiforgery provider
        //	new Claim(ClaimTypes.NameIdentifier, user.Email),
        //                            new Claim("http://schemas.microsoft.com/accesscontrolservice/2010/07/claims/identityprovider", "ASP.NET Identity", "http://www.w3.org/2001/XMLSchema#string"),

        //                            new Claim(ClaimTypes.Name, user.Name),
        //                            new Claim(ClaimTypes.Email, user.Email),
        //	// optionally you could add roles if any
        //	new Claim(ClaimTypes.Role, "User")
        //            },
        //            CookieAuthenticationDefaults.AuthenticationType);


        //    HttpContext.GetOwinContext().Authentication.SignIn(
        //                new AuthenticationProperties { IsPersistent = false }, ident);
        //    return Redirect("~/");

        //}
        string clientid = ConfigurationManager.AppSettings["GgAppId"];
        string redirection_url = ConfigurationManager.AppSettings["redirectUrl"];
        string clientsecret = ConfigurationManager.AppSettings["GgAppSecret"];
        string url = "https://account.google.com/o/oauth2/token";
        public void LoginGoogle()
        {
            
            string urls = "https://accounts.google.com/o/oauth2/v2/auth?scope=email&incude_granted_scopes=true&redirect_uri=" + redirection_url + "&response_type=code&client_id=" + clientid + "";
            Response.Redirect(urls);
        }

        public void GoogleCallback(string code)
        {
            string poststring = "grant_type=authorization_code&code=" + code + "&client_id=" + clientid + "&client_secret=" + clientsecret + "&redirect_uri=" + redirection_url + "";
            var request = (HttpWebRequest)WebRequest.Create(url);
            request.ContentType = "application/x-www-form-urlendcoded";
            request.Method = "POST";
            UTF8Encoding uTF8 = new UTF8Encoding();
            byte[] bytes = uTF8.GetBytes(poststring);
            Stream outputstream = null;
            try
            {
                request.ContentLength = bytes.Length;
                outputstream = request.GetRequestStream();
                outputstream.Write(bytes, 0, bytes.Length);
            }
            catch
            {

            }
            var response = (HttpWebResponse)request.GetResponse();
            var streamReader = new StreamReader(response.GetResponseStream());
            string reponseFromSever = streamReader.ReadToEnd();
            JavaScriptSerializer js = new JavaScriptSerializer();
            TokenClass obj = js.Deserialize<TokenClass>(reponseFromSever);
            GetLogin(obj.access_token);
        }

        public ActionResult GetLogin(string token)
        {
            string url2 = "https://www.googleapis.com/oauth2/v1/userinfo?alt=json&acess_token" + token + "";
            WebRequest request2 = WebRequest.Create(url2);
            request2.Credentials = CredentialCache.DefaultCredentials;
            WebResponse response2 = request2.GetResponse();
            Stream dataStream = response2.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);
            string reponseFromSever2 = reader.ReadToEnd();
            reader.Close();
            response2.Close();
            JavaScriptSerializer js2 = new JavaScriptSerializer();

            LoginModel userinfo = js2.Deserialize<LoginModel>(reponseFromSever2);
            var resultUser = new UserBLL().Find(userinfo.email);
            
            if(resultUser != null)
            {
                var userSession = new LoginModel();
                userSession.UserName = resultUser.UserName;
                userSession.email = resultUser.Email;
                Session.Add(CommonConstants.USER_SESSION, userSession);
            }
            return View();
        }
    }
}