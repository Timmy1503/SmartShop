using ConnectDb.BLL;
using ConnectDb.EF;
using Smart_Shop.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
namespace Smart_Shop.Areas.Admin.Controllers
{
    public class UserController : BaseController
    {
        // GET: Admin/User
        [HasCredential(RoleID ="VIEW_USER")]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var dao = new UserBLL();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        
        [HttpGet]
        [HasCredential(RoleID = "ADD_USER")]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        //[ValidateAntiForgeryToken]
        [HasCredential(RoleID = "ADD_USER")]
        public ActionResult Create(User user)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserBLL();
                var MD5 = Encrytor.MD5Hash(user.Password);
                user.Password = MD5;
                long id = dao.Insert(user);
                if (id > 0)
                {
                    SetAlert("Thêm User thành công", "success");
                    return RedirectToAction("Index", "User");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm User không thành công");
                }
            }
            return View("Create");
        }

        [HasCredential(RoleID = "EDIT_USER")]
        public ActionResult Edit(int id)
        {
            var user = new UserBLL().ViewDetail(id);
            return View(user);
        }

        [HttpPost]
        [HasCredential(RoleID = "EDIT_USER")]
        public ActionResult Edit(User user)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserBLL();
                if (!string.IsNullOrEmpty(user.Password))
                {
                    var MD5 = Encrytor.MD5Hash(user.Password);
                    user.Password = MD5;
                }
                var result = dao.Update(user);
                if (result)
                {
                    SetAlert("Sửa người dùng thành công", "success");
                    return RedirectToAction("Index", "User");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thông tin không thành công!");
                }
            }
            return View("Index");
        }

        [HttpPost]
        [HasCredential(RoleID = "DELETE_USER")]
        public JsonResult Delete(int id)
        {

            var user = new UserBLL().Delete(id);
            //return RedirectToAction("Index");
            return Json(new
            {
                status = true,
                JsonRequestBehavior.AllowGet
            });
        }
        [HttpPost]
        public JsonResult ChangeStatus(long id)
        {
            var result = new UserBLL().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }

        
    }
}