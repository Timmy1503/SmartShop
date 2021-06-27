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
    public class ContentController : BaseController
    {
        // GET: Admin/Content
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }

        //[HttpPost]
        //public ActionResult Create(Content model)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        var session = (UserLogin)Session[CommonConstants.USER_SESSION];
        //        model.CreateBy = session.UserName;
        //        var culture = Session[CommonConstants.CurrentCulture];
        //        //model.Language = culture.ToString();
        //        new ContentBLL().Create(model);
        //        return RedirectToAction("Index");
        //    }
        //    SetViewBag();
        //    return View();
        //}
        
        public void SetViewBag(long? selectedId = null)
        {
            var dao = new CategoryBLL();
            ViewBag.CategoryID = new SelectList(dao.ListAll(), "CategoryID", "CategoryName", selectedId);
        }
        //[HttpGet]
        //public ActionResult Edit(long id)
        //{
        //    var dao = new ContentBLL();
        //    var content = dao.GetByID(id);
        //    SetViewBag(content.CategoryID);
        //    return View(content);
        //}

        //[HttpPost]
        //public ActionResult Edit(Content model)
        //{
        //    if (ModelState.IsValid)
        //    {

        //    }
        //    SetViewBag(model.CategoryID);
        //    return View();
        //}

        
    }
}