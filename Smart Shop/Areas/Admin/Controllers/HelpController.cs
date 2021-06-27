using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ConnectDb.BLL;
using ConnectDb.EF;
namespace Smart_Shop.Areas.Admin.Controllers
{
    public class HelpController : BaseController
    {
        // GET: Admin/Help
        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var help = new HelpQuestionBLL();
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
        public ActionResult Create(HelpQuestion model)
        {
            if (ModelState.IsValid)
            {
                var dao = new HelpQuestionBLL();
                long id = dao.Insert(model);
                if (id > 0)
                {
                    SetAlert("Thêm thành công", "success");
                    return RedirectToAction("Index", "Help");
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
            var bll = new HelpQuestionBLL();
            var product = bll.ViewDetail(id);
            return View(product);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(HelpQuestion model)
        {
            if (ModelState.IsValid)
            {
                var bll = new HelpQuestionBLL();
                var result = bll.Update(model);
                if (result)
                {
                    SetAlert("Sửa thành công", "success");
                    return RedirectToAction("Index", "Help");
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
            var help = new HelpQuestionBLL().Delete(id);
            return Json(new
            {
                status = true,
                JsonRequestBehavior.AllowGet
            });
        }

        [HttpPost]
        public ActionResult ChangeStatus(long id)
        {
            var result = new HelpQuestionBLL().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}