using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ConnectDb.BLL;
namespace Smart_Shop.Controllers
{
    public class HelpQuestionController : Controller
    {
        // GET: HelpQuestion
        public ActionResult HelpQuestion()
        {
            ViewBag.HelpQuestion = new HelpQuestionBLL().ListAll();
            return View();
        }
    }
}