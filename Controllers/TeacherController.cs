using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Mvc;
using _14_TimeMachine2.Models;
using System.Web.Mvc.Html;
using System.Web.UI.WebControls;
using System.Data.Entity;
using _14_TimeMachine2.Filters;

namespace _14_TimeMachine2.Controllers
{
    [AuthorizeTeacher]
    public class TeacherController : Controller
    {
        public string courseSelected;

        private TM2Entities2 db = new TM2Entities2();
        private TM2Entities2 db2 = new TM2Entities2();

        public ActionResult Index()
        {
            var coursesForTeacher = db.USERs.Find("mgeary").getCoursesForUser();
            var selectlist = new SelectList(coursesForTeacher, "course_id", "course_name", 1);
            ViewData["Courses"] = selectlist;

            return View(coursesForTeacher);
        }

       [HttpPost]
       public ActionResult GetDropDownSelection(string DropDown)
       {
           courseSelected = DropDown;
           return RedirectToAction("Index"); 
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
