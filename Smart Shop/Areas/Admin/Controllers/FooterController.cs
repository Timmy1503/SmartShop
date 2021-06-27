using ConnectDb.BLL;
using ConnectDb.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Smart_Shop.Areas.Admin.Controllers
{
    public class FooterController : BaseController
    {
        // GET: Admin/Footer
        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var Footer = new FooterBLL();
            var model = Footer.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }

        [HttpGet]
        [ValidateInput(false)]

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]

        public ActionResult Create(Footer model)
        {
            if (ModelState.IsValid)
            {
                var bll = new FooterBLL();
                string id = bll.Insert(model);
                if (id != null)
                {
                    SetAlert("Thêm bài thành công", "success");
                    return RedirectToAction("Index", "Footer");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm bài viết không thành công");
                }
            }
            return View("Index");
        }

        [HttpGet]
        [ValidateInput(false)]

        public ActionResult Edit(long id)
        {
            var bll = new FooterBLL();
            var Footer = bll.ViewDetail(id);
            return View(Footer);
        }

        [HttpPost]
        [ValidateInput(false)]

        public ActionResult Edit(Footer model)
        {
            if (ModelState.IsValid)
            {
                var bll = new FooterBLL();
                var result = bll.Update(model);
                if (result)
                {
                    SetAlert("Sửa bản tin thành công", "success");
                    return RedirectToAction("Index", "Footer");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật bản tin không thành công");
                }
            }
            return View("Index");
        }

        [HttpPost]

        public ActionResult Delete(int id)
        {
            var Footer = new FooterBLL().Delete(id);
            return Json(new
            {
                status = true,
                JsonRequestBehavior.AllowGet
            });
        }

        [HttpPost]
        public ActionResult ChangeStatus(string id)
        {
            var result = new FooterBLL().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}