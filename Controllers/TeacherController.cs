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

namespace _14_TimeMachine2.Controllers
{
    public class CourseSummary
    {
        public int course_id;
        public char user_id;
        public char user_first_name;
        public char user_last_name;
        public int TotalHours;
        public int HoursDay;
        public int HoursWeek;
        public float ProjectedGrade;
    }

    public class TeacherController : Controller
    {
        private TM2Entities2 db = new TM2Entities2();
        public ActionResult Index()
        {

            return View();
        }

        public ActionResult GetCourseSummary()
        {            
            return View(db.COURSEs.ToList());
            

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

        public ActionResult CategoryChosen()
        {
            return View();
        }
    }
}
