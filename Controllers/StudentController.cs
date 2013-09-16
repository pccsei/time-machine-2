using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _14_TimeMachine2.Controllers
{
    public class StudentController : Controller
    {
        //
        // GET: /Student/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult TimeLog()
        {
            return View();
        }

        public ActionResult Summary()
        {
            return View();
        }
    }
}
