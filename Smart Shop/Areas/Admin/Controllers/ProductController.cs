using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Xml.Linq;
using ConnectDb.BLL;
using ConnectDb.EF;
using PagedList;
namespace Smart_Shop.Areas.Admin.Controllers
{
    public class ProductController : BaseController
    {
        // GET: Admin/Product
        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var product = new ProductBLL();
            var model = product.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }

        [HttpGet]
        [ValidateInput(false)]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create(Product model)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductBLL();
                long id = dao.Insert(model);
                if (id > 0)
                {
                    SetAlert("Thêm sản phẩm thành công", "success");
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm sản phẩm không thành công");
                }
            }
            SetViewBag();
            return View("Index");
        }

        public void SetViewBag(long? selectedId = null)
        {
            var dao = new CategoryBLL();
            ViewBag.CategoryID = new SelectList(dao.ListAll(), "CategoryID", "CategoryName", selectedId);
        }

        [HttpGet]
        [ValidateInput(false)]
        public ActionResult Edit(long id)
        {
            var bll = new ProductBLL();
            var product = bll.GetByID(id);
            SetViewBag(product.CategoryID);
            return View(product);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Product model)
        {
            if (ModelState.IsValid)
            {
                var bll = new ProductBLL();
                var result = bll.Update(model);
                if (result)
                {
                    SetAlert("Sửa sản phẩm thành công", "success");
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thông tin không thành công");
                }
            }
            SetViewBag(model.CategoryID);
            return View("Index");
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            var product = new ProductBLL().Delete(id);
            return Json(new
            {
                status = true,
                JsonRequestBehavior.AllowGet
            });
        }

        [HttpPost]
        public ActionResult ChangeStatus(long id)
        {
            var result = new ProductBLL().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
        
    }
}