using Smart_Shop.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ConnectDb.BLL;
using Smart_Shop.Common;

namespace Smart_Shop.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserBLL();
                var result = dao.Login(model.UserName, Encrytor.MD5Hash(model.PassWord), true);
                if (result == 1)
                {
                    var user = dao.UserGetByID(model.UserName);
                    var userSession = new UserLogin();
                    userSession.UserName = user.UserName;
                    userSession.UserID = user.UserID;
                    userSession.GroupID = user.UserGroupID;

                    var listCredentials = dao.GetListCredential(model.UserName);
                    Session.Add(CommonConstants.SESSION_CREDENTIALS, listCredentials);
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return RedirectToAction("Index", "Home");
                }
                else if(result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản đang bị khoá");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Sai mật khẩu");
                }
                else if (result == -3)
                {
                    ModelState.AddModelError("", "Tài khoản của bạn không có quyền đăng nhập");
                }
                else
                {
                    ModelState.AddModelError("", "Không thể đăng nhập");
                }
            }
            return View("Index");
        }

        public ActionResult Logout()
        {
            Session[CommonConstants.USER_SESSION] = null;
            return RedirectToAction("Login", "Login");
        }
    }
}