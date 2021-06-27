using ConnectDb.BLL;
using ConnectDb.EF;
using Smart_Shop.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Smart_Shop.Areas.Admin.Controllers
{
    public class AboutController : BaseController
    {
        // GET: Admin/About
       
        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var about = new AboutBLL();
            var model = about.ListAllPaging(searchString, page, pageSize);
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
        
        public ActionResult Create(About model)
        {
            if (ModelState.IsValid)
            {
                var bll = new AboutBLL();
                long id = bll.Insert(model);
                if (id > 0)
                {
                    SetAlert("Thêm bài thành công", "success");
                    return RedirectToAction("Index", "About");
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
            var bll = new AboutBLL();
            var about = bll.ViewDetail(id);
            return View(about);
        }

        [HttpPost]
        [ValidateInput(false)]
        
        public ActionResult Edit(About model)
        {
            if (ModelState.IsValid)
            {
                var bll = new AboutBLL();
                var result = bll.Update(model);
                if (result)
                {
                    SetAlert("Sửa bản tin thành công", "success");
                    return RedirectToAction("Index", "About");
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
            var about = new AboutBLL().Delete(id);
            return Json(new
            {
                status = true,
                JsonRequestBehavior.AllowGet
            });
        }

        [HttpPost]
        public ActionResult ChangeStatus(long id)
        {
            var result = new AboutBLL().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}