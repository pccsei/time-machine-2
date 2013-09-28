using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using _14_TimeMachine2.Models;
using _14_TimeMachine2.Filters;

namespace _14_TimeMachine2.Controllers
{
    [AuthorizeTeacher]
    public class StudentController : Controller
    {
        private TM2Entities2 db = new TM2Entities2();

        //public string currentUser = GlobalVariables.current_user_id;
        public string currentUser = "mgeary";
        

        public ActionResult Index()
        {
            var coursesForTeacher = db.USERs.Find(currentUser).getCoursesForUser();
            var selectlist = new SelectList(coursesForTeacher, "course_id", "course_name", 1);
            ViewData["Courses"] = selectlist;

            return View(coursesForTeacher);
        }

        [HttpPost]
        public ActionResult Create(USER newStudent)
        {
            if (ModelState.IsValid)
            {
                db.USERs.Add(newStudent);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }




        public ActionResult TimeLog()
        {
            return View();
        }

        //public ActionResult Summary()
        //{
        //    course_id.TitleFormat
        //    return View();
        //}

        [HttpPost]
        public ActionResult ToggleEnabled(string id)
        {
            _14_TimeMachine2.Models.USER user = new _14_TimeMachine2.Models.USER();
            user = db.USERs.Find(id);
            user.toggle_status();
            db.SaveChanges();

            return View();
        }
    }
}
