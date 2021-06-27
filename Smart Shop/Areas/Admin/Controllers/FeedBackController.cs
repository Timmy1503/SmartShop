using ConnectDb.BLL;
using ConnectDb.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Smart_Shop.Areas.Admin.Controllers
{
    public class FeedBackController : BaseController
    {
        // GET: Admin/FeedBack
        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var feedback = new FeedBackBLL();
            var model = feedback.ListAllPaging(searchString, page, pageSize);
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
        public ActionResult Create(FeedBack model)
        {
            if (ModelState.IsValid)
            {
                var dao = new FeedBackBLL();
                long id = dao.Insert(model);
                if (id > 0)
                {
                    SetAlert("Thêm thành công", "success");
                    return RedirectToAction("Index", "FeedBack");
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
            var bll = new FeedBackBLL();
            var feedBack = bll.ViewDetail(id);
            return View(feedBack);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(FeedBack model)
        {
            if (ModelState.IsValid)
            {
                var bll = new FeedBackBLL();
                var result = bll.Update(model);
                if (result)
                {
                    SetAlert("Sửa thành công", "success");
                    return RedirectToAction("Index", "FeedBack");
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
            var feedBack = new FeedBackBLL().Delete(id);
            return Json(new
            {
                status = true,
                JsonRequestBehavior.AllowGet
            });
        }

        [HttpPost]
        public ActionResult ChangeStatus(long id)
        {
            var result = new FeedBackBLL().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}