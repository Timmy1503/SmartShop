using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Smart_Shop
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.IgnoreRoute("{*botdetect}",
   new { botdetect = @"(.*)BotDetectCaptcha\.ashx" });

            routes.MapRoute(
                name: "About",
                url: "gioi-thieu",
                defaults: new { controller = "About", action = "Index", id = UrlParameter.Optional },
             namespaces: new[] { "Smart_Shop.Controllers" }
                );

            routes.MapRoute(
                name: "Contact",
                url: "lien-he",
                defaults: new { controller = "Contact", action = "Index", id = UrlParameter.Optional },
             namespaces: new[] { "Smart_Shop.Controllers" }
                );

            routes.MapRoute(
                name: "Payment Success",
                url: "hoan-thanh",
                defaults: new { controller = "Cart", action = "Success", id = UrlParameter.Optional },
             namespaces: new[] { "Smart_Shop.Controllers" }
                );

            routes.MapRoute(
                name: "Payment ",
                url: "thanh-toan",
                defaults: new { controller = "Cart", action = "Payment", id = UrlParameter.Optional },
             namespaces: new[] { "Smart_Shop.Controllers" }
                );

            routes.MapRoute(
                name: "ResetPassword",
                url: "dat-lai-mat-khau",
                defaults: new { controller = "User", action = "ResetPassword", id = UrlParameter.Optional },
             namespaces: new[] { "Smart_Shop.Controllers" }
                );

            routes.MapRoute(
                name: "HelpQuestion ",
                url: "cau-hoi-tro-giup",
                defaults: new { controller = "HelpQuestion", action = "HelpQuestion", id = UrlParameter.Optional },
             namespaces: new[] { "Smart_Shop.Controllers" }
                );

            routes.MapRoute(
               name: "Add Cart",
               url: "them-gio-hang",
               defaults: new { controller = "Cart", action = "AddItem", id = UrlParameter.Optional },
            namespaces: new[] { "Smart_Shop.Controllers" }
               );

            routes.MapRoute(
               name: "Cart",
               url: "gio-hang",
               defaults: new { controller = "Cart", action = "Index", id = UrlParameter.Optional },
            namespaces: new[] { "Smart_Shop.Controllers" }
               );

            routes.MapRoute(
              name: "ForgotPassword",
              url: "quen-mat-khau",
              defaults: new { controller = "User", action = "ForgotPassword", id = UrlParameter.Optional },
           namespaces: new[] { "Smart_Shop.Controllers" }
              );

            routes.MapRoute(
                name: "FeedBack",
                url: "tro-giup",
                defaults: new { controller = "FeedBack", action = "FeedBack", id = UrlParameter.Optional },
             namespaces: new[] { "Smart_Shop.Controllers" }
                );

            routes.MapRoute(
                name: "Login",
                url: "dang-nhap",
                defaults: new { controller = "User", action = "Login", id = UrlParameter.Optional },
             namespaces: new[] { "Smart_Shop.Controllers" }
                );

            routes.MapRoute(
                name: "Register",
                url: "tao-tai-khoan",
                defaults: new { controller = "User", action = "Register", id = UrlParameter.Optional },
             namespaces: new[] { "Smart_Shop.Controllers" }
                );

            routes.MapRoute(
               name: "Search",
               url: "tim-kiem",
               defaults: new { controller = "Product", action = "Search", id = UrlParameter.Optional },
            namespaces: new[] { "Smart_Shop.Controllers" }
               );

            routes.MapRoute(
               name: "List Shop",
               url: "cua-hang-tap-hoa",
               defaults: new { controller = "Product", action = "ListShop", id = UrlParameter.Optional },
            namespaces: new[] { "Smart_Shop.Controllers" }
               );

            routes.MapRoute(
               name: "List Family",
               url: "do-dung-gia-dinh",
               defaults: new { controller = "Product", action = "ListFamily", id = UrlParameter.Optional },
            namespaces: new[] { "Smart_Shop.Controllers" }
               );

            routes.MapRoute(
               name: "List Personal",
               url: "do-dung-ca-nhan",
               defaults: new { controller = "Product", action = "ListPersonal", id = UrlParameter.Optional },
            namespaces: new[] { "Smart_Shop.Controllers" }
               );

            routes.MapRoute(
               name: "List Food",
               url: "thuc-pham-dong-goi",
               defaults: new { controller = "Product", action = "ListFood", id = UrlParameter.Optional },
            namespaces: new[] { "Smart_Shop.Controllers" }
               );

            routes.MapRoute(
               name: "List Drink",
               url: "do-uong",
               defaults: new { controller = "Product", action = "ListDrink", id = UrlParameter.Optional },
            namespaces: new[] { "Smart_Shop.Controllers" }
               );

            routes.MapRoute(
              name: "List Special",
              url: "san-pham-dac-biet",
              defaults: new { controller = "Product", action = "ListSpecial", id = UrlParameter.Optional },
           namespaces: new[] { "Smart_Shop.Controllers" }
              );

            routes.MapRoute(
                name: "Product Category",
                url: "san-pham/{metatitle}-{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
             namespaces: new[] { "Smart_Shop.Controllers" }
                );

            routes.MapRoute(
                name: "Product Detail",
                url: "chi-tiet/{metatitle}-{id}",
                defaults: new { controller = "Product", action = "Detail", id = UrlParameter.Optional },
             namespaces: new[] { "Smart_Shop.Controllers" }
                );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
             namespaces: new[] { "Smart_Shop.Controllers" }
                );
        }
    }
}
