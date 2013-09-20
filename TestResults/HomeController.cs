using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _14_TimeMachine2.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index(int Id)
        {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

            return View("Details");
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult TimeLog()
        {
            return View();
        }
        // Controller to student add time entry page - NPC
        public ActionResult TimeEntry()
        {
            return View();
        }
    }

}
