using ConnectDb.BLL;
using ConnectDb.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Smart_Shop.Areas.Admin.Controllers
{
    public class MenuController : BaseController
    {
        // GET: Admin/Menu
        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var menu = new MenuBLL();
            var model = menu.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }

        public void SetViewBag(long? selectedId = null)
        {
            var dao = new MenuBLL();
            ViewBag.MenuTypeID = new SelectList(dao.ListAll(), "MenuTypeID", "MenuTypeName", selectedId);
        }

        [HttpGet]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Create(Menu model)
        {
            if (ModelState.IsValid)
            {
                var bll = new MenuBLL();
                long id = bll.Insert(model);
                if (id > 0)
                {
                    SetAlert("Thêm bản ghi thành công", "success");
                    return RedirectToAction("Index", "Menu");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm bản ghi không thành công");
                }
            }
            SetViewBag();
            return View("Index");
        }

        [HttpGet]
        public ActionResult Edit(long id)
        {
            var bll = new MenuBLL();
            var menu = bll.ViewDetail(id);
            SetViewBag(menu.MenuID);
            return View(menu);
        }

        [HttpPost]
       
        public ActionResult Edit(Menu model)
        {
            if (ModelState.IsValid)
            {
                var bll = new MenuBLL();
                var result = bll.Update(model);
                if (result)
                {
                    SetAlert("Sửa thành công", "success");
                    return RedirectToAction("Index", "Menu");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thông tin không thành công");
                }
            }
            SetViewBag(model.MenuID);
            return View("Index");
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            var menu = new MenuBLL().Delete(id);
            return Json(new
            {
                status = true,
                JsonRequestBehavior.AllowGet
            });
        }

        [HttpPost]
        public ActionResult ChangeStatus(long id)
        {
            var result = new MenuBLL().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}