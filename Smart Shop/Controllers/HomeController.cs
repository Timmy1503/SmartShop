using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ConnectDb.BLL;
using Smart_Shop.Common;
using Smart_Shop.Models;

namespace Smart_Shop.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        private const string CartSession = "CartSession";
        public ActionResult Index()
        {
            ViewBag.Slide = new SlideBLL().ListAll();
            ViewBag.ListTopSlide = new SlideBLL().ListTopSlide(3);
            var productDao = new ProductBLL();
            ViewBag.NewProducts = productDao.ListNewProduct(6);
            ViewBag.ListFeatureProducts = productDao.ListFeatureProduct(14);
            ViewBag.ListSpecialProduct = productDao.ListSpecialProduct(4);

            ViewBag.Title = ConfigurationManager.AppSettings["HomeTitle"];
            ViewBag.Keywords = ConfigurationManager.AppSettings["HomeKeyWord"];
            ViewBag.Descriptions = ConfigurationManager.AppSettings["HomeDescription"];
            return View();
        }

        

        [ChildActionOnly]
        public ActionResult MainMenu()
        {
            var model = new MenuBLL().ListByGroupID(1);
            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult TopMenu()
        {
            var model = new MenuBLL().ListByGroupID(2);
            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult Footer()
        {
            var model = new FooterBLL().GetFooter();
            return PartialView(model);
        }

        //public ActionResult AddToCart(int productId)
        //{
        //    List<CartItem> cart = new List<CartItem>();
        //    var product = new ProductBLL().ViewDetail(productId);
        //    cart.Add(new CartItem()
        //    {
        //        Product = product,
        //        Quantity = 1
        //    });
        //    Session["CartSession"] = cart;
        //    return Redirect("Index");
        //}


        [ChildActionOnly]
        public PartialViewResult HeaderCart()
        {
            var cart = Session[CommonConstants.CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }

            return PartialView(list);
        }
    }
}