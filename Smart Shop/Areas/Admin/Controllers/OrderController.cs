using ConnectDb.BLL;
using ConnectDb.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Smart_Shop.Areas.Admin.Controllers
{
    public class OrderController : BaseController
    {
        // GET: Admin/Order
        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var order = new OrderBLL();
            var model = order.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            ViewBag.OrderDetail = new OrderDetailBLL();
            return View(model);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Order model)
        {
            if (ModelState.IsValid)
            {
                var dao = new OrderBLL();
                long id = dao.Insert(model);
                if (id > 0)
                {
                    SetAlert("Thêm thành công", "success");
                    return RedirectToAction("Index", "Order");
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
            var bll = new OrderBLL();
            var order = bll.ViewDetail(id);
            return View(order);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Order model)
        {
            if (ModelState.IsValid)
            {
                var bll = new OrderBLL();
                var result = bll.Update(model);
                if (result)
                {
                    SetAlert("Sửa thành công", "success");
                    return RedirectToAction("Index", "Order");
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
            var order = new OrderBLL().Delete(id);
            return Json(new
            {
                status = true,
                JsonRequestBehavior.AllowGet
            });
        }

        [HttpPost]
        public ActionResult ChangeStatus(long id)
        {
            var result = new OrderBLL().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }

       
        public ActionResult Detail(int? id)
        {
            if(id == null)
            {
                //return RedirectToAction("Index");
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            
            var bll = new OrderBLL();
            var order = bll.Detail(id);
            if(order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }
    }
}