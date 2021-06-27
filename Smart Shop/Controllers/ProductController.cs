using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ConnectDb.BLL;
namespace Smart_Shop.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        public PartialViewResult ProductCategory()
        {
            var model = new ProductCategoryBLL().ListAll();
            return PartialView(model);
        }

        public ActionResult ListShop()
        {
            var list = new ProductBLL().ListShop();
            ViewBag.ListShop = list;
            return View();
        }

        public ActionResult ListFamily()
        {
            var list = new ProductBLL().ListFamily();
            ViewBag.ListFamily = list;
            return View();
        }

        public ActionResult ListPersonal()
        {
            var list = new ProductBLL().ListPersonal();
            ViewBag.ListPersonal = list;
            return View();
        }

        public ActionResult ListFood()
        {
            var list = new ProductBLL().ListFood();
            ViewBag.ListFood = list;
            return View();
        }

        public ActionResult ListDrink()
        {
            var list = new ProductBLL().ListDrink();
            ViewBag.ListDrink = list;
            return View();
        }

        public ActionResult ListSpecial()
        {
            var list = new ProductBLL().ListSpecial();
            ViewBag.ListSpecial = list;
            return View();
        }

        public ActionResult Category(long cateId, int page = 1, int pageSize = 5)
        {
            var category = new MenuBLL().ViewDetail(cateId);
            ViewBag.Category = category;
            int totalRecord = 0;
            var model = new ProductBLL().ListByCategoryId(cateId, ref totalRecord, page, pageSize);

            ViewBag.Total = totalRecord;
            ViewBag.Page = page;

            int maxPage = 5;
            int totalPage = 0;

            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);
        }



        public ActionResult Detail(long id)
        {
            var product = new ProductBLL().ViewDetail(id);
            ViewBag.Category = new CategoryBLL().ViewDetail(product.CategoryID.Value);
            ViewBag.RelatedProduct = new ProductBLL().ListRelatedProduct(4);
            return View(product);
        }

        public JsonResult ListName(string q)
        {
            var data = new ProductBLL().ListName(q);
            return Json(new
            {
                data = data,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Search(string keyword, int page = 1, int pageSize = 1)
        {
            int totalRecord = 0;
            var model = new ProductBLL().Search(keyword, ref totalRecord, page, pageSize);

            ViewBag.Total = totalRecord;
            ViewBag.Page = page;
            ViewBag.Keyword = keyword;

            int maxPage = 5;
            int totalPage = 0;

            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);
        }
    }
}