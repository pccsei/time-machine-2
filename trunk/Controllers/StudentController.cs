using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using _14_TimeMachine2.Models;
using _14_TimeMachine2.Filters;
using System.Net;
using System.Net.Mime;

namespace _14_TimeMachine2.Controllers
{
    [AuthorizeTeacher]
    public class StudentController : Controller
    {
        private TM2Entities2 db = new TM2Entities2();

        public string currentUser = GlobalVariables.current_user_id;
        //public string currentUser = "115245";

        public ActionResult Index()
        {
            var coursesForTeacher = db.USERs.Find(currentUser).getCoursesForUser();
            var selectlist = new SelectList(coursesForTeacher, "course_id", "course_name", 1);
            ViewData["Courses"] = selectlist;

            return View(coursesForTeacher);
        }

        [HttpPost]
        public ActionResult Create(FormCollection member)
        {
            bool isMember = false;
            string firstName = member.Get("user_first_name");
            string lastName = member.Get("user_last_name");
            string userID = member.Get("user_id");
            int CourseID = Int32.Parse(member.Get("CourseList"));
            string error;
            COURSE selectedCourse = db.COURSEs.Find(CourseID);

            USER user = db.USERs.Find(userID);

            if (user == null && (firstName == string.Empty || lastName == string.Empty))
            {
                error = "User does not exist. Enter first and last name, or an existing student ID";
                //Response.StatusCode = (int)HttpStatusCode.BadRequest;
                //return Json(new { success = false, response = error });
                return RedirectToAction("index");
            }
            else if (user == null && (firstName != string.Empty && lastName != string.Empty))
            {
                USER newStudent = new USER();
                newStudent.user_id = userID;
                newStudent.user_first_name = firstName;
                newStudent.user_last_name = lastName;
                newStudent.user_is_enabled = 1;
                newStudent.user_is_manager = 0;
                newStudent.user_is_student = 1;
                newStudent.user_is_teacher = 0;

                if (ModelState.IsValid)
                {
                    db.USERs.Add(newStudent);
                    db.SaveChanges();
                    user = db.USERs.Find(userID);
                }
                else
                {
                    //error = "Unable to create save new user: " + newStudent.user_id;
                    //return Json(new { success = false, response = error });
                    return RedirectToAction("index");
                }
            }

            ICollection<MEMBER> members = user.MEMBERs;
            
            foreach (MEMBER m in members)
            {
                if (m.member_course_id == CourseID)
                    isMember = true; 
            }

            if (isMember == false)
            {
                MEMBER newMember = new MEMBER();
                newMember.member_course_id = CourseID;
                newMember.member_user_id = userID;
                newMember.member_position = "Student";
                newMember.member_is_enabled = 1;

                db.MEMBERs.Add(newMember);
                db.SaveChanges();
                user = db.USERs.Find(userID);
            }
            return RedirectToAction("index");
        }




        public ActionResult TimeLog()
        {
            return View();
        }

        public ActionResult WeeklyView()
        {
            var coursesForTeacher = db.USERs.Find(currentUser).getCoursesForUser();
            var selectlist = new SelectList(coursesForTeacher, "course_id", "course_name", 1);
            ViewData["Courses"] = selectlist;

            return View(coursesForTeacher);
        }

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
