using ConnectDb.BLL;
using ConnectDb.EF;
using Smart_Shop.Common;
using Smart_Shop.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace Smart_Shop.Controllers
{
    public class CartController : Controller
    {
        private const string CartSession = "CartSession";
        // GET: Cart
        public ActionResult Index()
        {
            if (Session[CommonConstants.USER_SESSION] == null)
            {
                return Redirect("/dang-nhap");
            }
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
                //var user = new UserLogin();
                
            }
            else
            {
                
            }
            return View(list);
        }

        public JsonResult DeleteAll()
        {
            Session[CartSession] = null;
            return Json(new
            {
                status = true
            });
        }

       

        public JsonResult Delete(long id)
        {
            var sessionCart = (List<CartItem>)Session[CartSession];
            sessionCart.RemoveAll(x => x.Product.ProductID == id);
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }
        
        
        public JsonResult Update(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessionCart = (List<CartItem>)Session[CartSession];

            foreach (var item in sessionCart)
            {

                var jsonItem = jsonCart.SingleOrDefault(x => x.Product.ProductID == item.Product.ProductID);
                if (jsonItem != null)
                {
                    item.Quantity = jsonItem.Quantity;
                }
            }
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }

        public ActionResult AddItem(long productId, int quantity)
        {
            if (Session[CommonConstants.USER_SESSION] == null)
            {
                string returnUrl = ("/them-gio-hang?productId=" + productId + "&quantity=" + quantity); /*loi quantity*/
                string abc = "/dang-nhap?returnUrl=" + HttpUtility.UrlEncode(Uri.UnescapeDataString(returnUrl));
                return Redirect(abc);
            }
            else
            {
                var product = new ProductBLL().ViewDetail(productId);
                var cart = Session[CartSession];
                if (cart != null)
                {
                    var list = (List<CartItem>)cart;
                    if (list.Exists(x => x.Product.ProductID == productId))
                    {

                        foreach (var item in list)
                        {

                            if (item.Product.ProductID == productId)
                            {
                                item.Quantity += quantity;
                            }
                        }
                    }
                    else
                    {
                        //tạo mới đối tượng cart item
                        var item = new CartItem();
                        item.Product = product;
                        item.Quantity = quantity;
                        list.Add(item);
                    }
                    //Gán vào session
                    Session[CartSession] = list;
                }
                else
                {
                    //tạo mới đối tượng cart item
                    var item = new CartItem();
                    item.Product = product;
                    item.Quantity = quantity;
                    var list = new List<CartItem>();
                    list.Add(item);
                    //Gán vào session
                    Session[CartSession] = list;
                }
                return RedirectToAction("Index");
            }
        }

        [HttpGet]
        public ActionResult Payment()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }

        [HttpPost]
        public ActionResult Payment(string shipName, string mobile, string address, string email, string userName)
        {
            var order = new Order();
            
            order.CreatDate = DateTime.Now;
            order.ShipAddress = address;
            order.ShipMobile = mobile;
            order.UserName = ((UserLogin) Session[CommonConstants.USER_SESSION]).UserName;
            order.ShipName = shipName;
            order.ShipEmail = email;

            try
            {
                var id = new OrderBLL().Insert(order);
                var cart = (List<CartItem>)Session[CartSession];
                var detailBLL = new OrderDetailBLL();
                decimal total = 0;
                foreach (var item in cart)
                {
                    var orderDetail = new OrderDetail();
                    
                    orderDetail.ProductID = item.Product.ProductID;
                    orderDetail.OrderID = id;
                    orderDetail.Price = item.Product.PromotionPrice;
                    orderDetail.Quantity = item.Quantity;
                    detailBLL.Insert(orderDetail);

                    total += (item.Product.PromotionPrice.GetValueOrDefault(0) * item.Quantity);
                }
                //string content = System.IO.File.ReadAllText(Server.MapPath("~/assets/client/template/neworder.html"));

                //content = content.Replace("{{CustomerName}}", shipName);
                //content = content.Replace("{{Phone}}", mobile);
                //content = content.Replace("{{Email}}", email);
                //content = content.Replace("{{Address}}", address);
                //content = content.Replace("{{Total}}", total.ToString("N0"));
                //var toEmail = ConfigurationManager.AppSettings["ToEmailAddress"].ToString();

                //new MailHelper().SendMail(email, "Đơn hàng mới từ OnlineShop", content);
                //new MailHelper().SendMail(toEmail, "Đơn hàng mới từ OnlineShop", content);
            }
            catch (Exception ex)
            {
                //ghi log
                return Redirect("/loi-thanh-toan");
            }
            return Redirect("/hoan-thanh");
        }

        public ActionResult Success()
        {
            return View();
        }

 
    }
}