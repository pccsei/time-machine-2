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

        [AuthorizeStudent]
        [AuthorizeTeacher]
        public ActionResult Summary(int id = 0)
        {
            USER user = db.USERs.Find(currentUser);
            Dictionary<string, Dictionary<string, float>> stats = new Dictionary<string, Dictionary<string, float>>();
            if(id != 0 && user.is_teacher() == true)
                user = db.USERs.Find(id.ToString());
            else
                user = db.USERs.Find(currentUser);

            ICollection<ENTRY> entryData = user.ENTRies;

            Dictionary<string, Dictionary<int, double>> summary = new Dictionary<string, Dictionary<int, double>>();
            foreach (COURSE course in user.getCoursesForUser())
            {
                summary.Add(course.course_name, new Dictionary<int, double>());
                int submitDay = course.course_submit_day;
                DateTime courseStartDay = course.course_begin_date;
                DateTime relStartDay = DateTime.Parse(courseStartDay.ToString());

                int startDayInt = (int)relStartDay.DayOfWeek;
                
                int extraDays = submitDay - startDayInt;
                if (extraDays < 0)
                    extraDays = 6 + extraDays;
                List<int> projectIDs = new List<int>();
                relStartDay = relStartDay.AddDays(extraDays).Date;

                foreach(PROJECT project in course.PROJECTs)
                {
                    projectIDs.Add(project.project_id);
                }

                foreach (ENTRY entry in entryData)
                {
                    if (projectIDs.Contains((int)entry.entry_project_id))
                    {
                        Double days = Double.Parse((DateTime.Parse(entry.entry_begin_time.ToString()).Date - relStartDay).TotalDays.ToString());
                        int week = (int)Math.Floor(days / 7) + 1;
                        if (days < 0) { week = 1; }
                        if (days < 0 && days % 7 == 0) { week -= 1; }

                        if (summary[course.course_name].ContainsKey(week))
                        {
                            summary[course.course_name][week] += Double.Parse((entry.entry_total_time/ 60.0).ToString());
                        }
                        else
                        {
                            summary[course.course_name].Add(week, Double.Parse((entry.entry_total_time/60.0).ToString()));
                        }
                    }
                }
                stats.Add(course.course_name, user.getCourseStatsForStudentDictionary(course.course_id));
            }


            ViewData["Summary"] = summary;
            ViewData["Stats"] = stats;


            
            return View("Summary");
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
