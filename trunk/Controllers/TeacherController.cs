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
    public class TeacherController : Controller
    {
        public string courseSelected;

        private TM2Entities2 db = new TM2Entities2();
        private TM2Entities2 db2 = new TM2Entities2();

        public ActionResult Index()
        {
            
            var query = (from courses in db.COURSEs 
                         select courses).ToList();

            List<string> listOfCourses = new List<string>();

            var memberQuery = (from members in db.MEMBERs
                               select members).ToList();

            List<string> listOfMembers = new List<string>();

            foreach (var member in memberQuery)
            {

                foreach (var item in query)
                {
                    //"mgeary" will be changed to indicate whatever teacher is currently logged in
                    if ((item.course_id == member.member_course_id) && (member.member_user_id == "rhowell"))
                        listOfCourses.Add(item.course_name);
                }
            }
            ViewBag.listOfCourseNames = listOfCourses;



            return View(db.class_summary.ToList());
        }

        public ActionResult SortStudent(string sortOrder)
        {
            ViewBag.NameSort = String.IsNullOrEmpty(sortOrder) ? "Name_desc" : "";
            ViewBag.HourSort = sortOrder == "Hours" ? "Hours_des" : "Hours";
            var students = from student in db.USERs select student;
            var hours = from hour in db.class_summary select hour;

            switch (sortOrder)
            {
                case "Name_desc":
                    students = students.OrderByDescending(student => student.user_first_name);
                    break;
                case "Hours":
                    hours = hours.OrderBy(hour => hour.TotalHours);
                    break;
                default:
                    students = students.OrderBy(student => student.user_first_name);
                    break;
            }
            return View(db.class_summary.ToList());
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

        public ActionResult TeacherSummary()
        {
            var db = new TM2Entities2();

            return View(db.class_summary.ToList());
        }
    }
}
