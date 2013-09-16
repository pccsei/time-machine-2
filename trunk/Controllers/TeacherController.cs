using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _14_TimeMachine2.Controllers
{
    public class TeacherController : Controller
    {
        //
        // GET: /Teacher/

        // The default page for teacher's, includes summary information
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Timelog()
        {
            return View();
        }

        public ActionResult WeeklyReports()
        {
            return View();
        }

        public ActionResult Settings()
        {
            return View();
        }

        public ActionResult Alerts()
        {
            return View();
        }
    }
}
