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
    public class UserGroupController : BaseController
    {
        // GET: Admin/UserGroup
        [HasCredential(RoleID = "VIEW_USER")]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var dao = new UserGroupBLL();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }

        public void SetViewBag(string selectedId = null)
        {
            var dao = new UserGroupBLL();
            ViewBag.UserGroupID = new SelectList(dao.ListAll(), "UserGroupID", "UserGroupName", selectedId);
        }

        [HttpGet]
        [HasCredential(RoleID = "ADD_USER")]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasCredential(RoleID = "ADD_USER")]
        public ActionResult Create(User model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserGroupBLL();
                long id = dao.Insert(model);
                if (id > 0)
                {
                    SetAlert("Thêm nguời dùng thành công", "success");
                    return RedirectToAction("Index", "UserGroup");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm người dùng không thành công");
                }
            }
            SetViewBag();
            return View("Index");
        }

        [HttpGet]
        [HasCredential(RoleID = "EDIT_USER")]
        public ActionResult Edit(int id)
        {
            var bll = new UserGroupBLL();
            var user = bll.ViewDetail(id);
            SetViewBag(user.UserGroupID);
            return View(user);
        }

        [HttpPost]
        [HasCredential(RoleID = "EDIT_USER")]
        public ActionResult Edit(User model)
        {
            if (ModelState.IsValid)
            {
                var bll = new UserGroupBLL();
                var result = bll.Update(model);
                if (result)
                {
                    SetAlert("Sửa người dùng thành công", "success");
                    return RedirectToAction("Index", "UserGroup");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thông tin người dùng không thành công");
                }
            }
            SetViewBag(model.UserGroupID);
            return View("Index");
        }

        [HttpPost]
        [HasCredential(RoleID = "DELETE_USER")]
        public ActionResult Delete(int id)
        {
            var product = new UserGroupBLL().Delete(id);
            return Json(new
            {
                status = true,
                JsonRequestBehavior.AllowGet
            });
        }

        [HttpPost]
        public ActionResult ChangeStatus(long id)
        {
            var result = new UserGroupBLL().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}