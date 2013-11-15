﻿using System;
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
    public class StudentController : Controller
    {
        private TM2Entities2 db = new TM2Entities2();

        public string currentUser = GlobalVariables.current_user_id;
        //public string currentUser = "115245";

        [AuthorizeTeacher]
        public ActionResult Index()
        {
            return RedirectToAction("List");
        }

        [AuthorizeTeacher]
        public ActionResult List()
        {
            var coursesForTeacher = db.USERs.Find(currentUser).getCoursesForUser();
            var selectlist = new SelectList(coursesForTeacher, "course_id", "course_name", 1);
            ViewData["Courses"] = selectlist;

            return View("Index", coursesForTeacher);
        }

        [AuthorizeBoth]
        public ActionResult Summary(string id = null)
        {
            USER user;
            USER student = user = db.USERs.Find(currentUser);

            if (user.is_teacher())
            {
                if (id != null)
                    student = db.USERs.Find(id);
                else
                {
                    if (!user.is_student())
                        return RedirectToAction("Index");
                }
            }

            ICollection<ENTRY> entryData = student.ENTRies;
            
            // Get courses for the current user. May be student or teacher
            List<int> currentUserCoursesIDs = new List<int>();
            foreach (COURSE c in user.getCoursesForUser())
            {
                currentUserCoursesIDs.Add(c.course_id);
            }
            
            // Get courses for the student
            List<int> studentCourseIDs = new List<int>();
            List<COURSE> studentCourses = student.getCoursesForUser();
            foreach (COURSE c in studentCourses)
            {
                studentCourseIDs.Add(c.course_id);
            }

            Dictionary<COURSE, List<float>> weekly_course_totals = new Dictionary<COURSE, List<float>>();
            foreach (COURSE course in studentCourses)
            {
                if (currentUserCoursesIDs.Contains(course.course_id)) // If current user is a teacher, show only that teacher's courses with the student
                    weekly_course_totals.Add(course, student.getWeeklyHoursForCourse(course.course_id));
            }

            ViewData["WeeklyCourseTotals"] = weekly_course_totals;

            return View(student);
        }

        [AuthorizeTeacher]
        public ActionResult WeeklyTotals()
        {
            var coursesForTeacher = db.USERs.Find(currentUser).getCoursesForUser();
            var selectlist = new SelectList(coursesForTeacher, "course_id", "course_name", 1);
            ViewData["Courses"] = selectlist;

            return View(coursesForTeacher);
        }

        [AuthorizeTeacher]
        [HttpPost]
        public ActionResult Create(FormCollection member)
        {
            bool isMember = false;
            string firstName = member.Get("user_first_name");
            string lastName = member.Get("user_last_name");
            string userID = member.Get("user_id");
            int CourseID = Int32.Parse(member.Get("CourseList"));
            //string error;
            COURSE selectedCourse = db.COURSEs.Find(CourseID);

            USER user = db.USERs.Find(userID);

            if (user == null && (firstName == string.Empty || lastName == string.Empty))
            {
                //error = "User does not exist. Enter first and last name, or an existing student ID";
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

        [AuthorizeTeacher]
        public ActionResult TimeLog()
        {
            return View();
        }

        [AuthorizeTeacher]
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
