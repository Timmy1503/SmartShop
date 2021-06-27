using ConnectDb.BLL;
using ConnectDb.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Smart_Shop.Areas.Admin.Controllers
{
    public class SlideController : BaseController
    {
        // GET: Admin/Slide
        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var help = new SlideBLL();
            var model = help.ListAllPaging(searchString, page, pageSize);
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
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create(Slide model)
        {
            if (ModelState.IsValid)
            {
                var dao = new SlideBLL();
                long id = dao.Insert(model);
                if (id > 0)
                {
                    SetAlert("Thêm thành công", "success");
                    return RedirectToAction("Index", "Slide");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm không thành công");
                }
            }
            return View("Index");
        }

        [HttpGet]
        [ValidateInput(false)]
        public ActionResult Edit(long id)
        {
            var bll = new SlideBLL();
            var product = bll.ViewDetail(id);
            return View(product);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Slide model)
        {
            if (ModelState.IsValid)
            {
                var bll = new SlideBLL();
                var result = bll.Update(model);
                if (result)
                {
                    SetAlert("Sửa thành công", "success");
                    return RedirectToAction("Index", "Slide");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thông tin không thành công");
                }
            }
            return View("Index");
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            var help = new SlideBLL().Delete(id);
            return Json(new
            {
                status = true,
                JsonRequestBehavior.AllowGet
            });
        }

        [HttpPost]
        public ActionResult ChangeStatus(long id)
        {
            var result = new SlideBLL().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}