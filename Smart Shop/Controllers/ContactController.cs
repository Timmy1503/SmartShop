using ConnectDb.BLL;
using ConnectDb.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Smart_Shop.Controllers
{
    public class ContactController : Controller
    {
        // GET: Contact
        public ActionResult Index()
        {
            var model = new ContactBLL().GetActiveContact();
            return View();
        }

        [HttpPost]
        public JsonResult Send(string name, string email, string phone, string subject, string content)
        {
            var feedback = new FeedBack();
            feedback.FeedBackName = name;
            feedback.Email = email;
            feedback.Phone = phone;
            feedback.CreateDate = DateTime.Now;
            feedback.Content = content;
            feedback.Subject = subject;

            var id = new ContactBLL().InsertFeedBack(feedback);
            if (id > 0)
                return Json(new
                {
                    status = true
                });
            else
                return Json(new
                {
                    status = false
                });
        }
    }
}