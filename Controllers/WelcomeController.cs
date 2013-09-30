using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _14_TimeMachine2.Models;

namespace _14_TimeMachine2.Controllers
{
    public class WelcomeController : Controller
    {
        //
        // GET: /Welcome/

        TM2Entities2 db = new TM2Entities2();
        public string currentUser = GlobalVariables.current_user_id;

        public ActionResult Index()
        {
            if ((bool)HttpContext.Session["userIsStudent"])
                return RedirectToAction("Index", "TimeEntry");
            else if ((bool)HttpContext.Session["userIsTeacher"])
                return RedirectToAction("Index", "Student");
            else if ((bool)HttpContext.Session["userIsManager"])
                return RedirectToAction("Index", "Teacher");
            else
                return RedirectToAction("Index", "Error");
        }
        
        public string ToggleMeStudent()
        {
            _14_TimeMachine2.Models.USER user = new _14_TimeMachine2.Models.USER();
            user = db.USERs.Find(currentUser);
            user.user_is_student = (short) (user.user_is_student ^ 1);
            db.SaveChanges();

            return (user.is_student() ? "You're now a student" : "You're no longer a student");
        }

        public string ToggleMeTeacher()
        {
            _14_TimeMachine2.Models.USER user = new _14_TimeMachine2.Models.USER();
            user = db.USERs.Find(currentUser);
            user.user_is_teacher = (short) (user.user_is_teacher ^ 1);
            db.SaveChanges();

            return (user.is_teacher() ? "You're now a teacher" : "You're no longer a teacher");
        }

        public string ToggleMeManager()
        {
            _14_TimeMachine2.Models.USER user = new _14_TimeMachine2.Models.USER();
            user = db.USERs.Find(currentUser);
            user.user_is_manager = (short) (user.user_is_manager ^ 1);
            db.SaveChanges();

            return (user.is_manager() ? "You're now a manager" : "You're no longer a manager");
        }

        public string ToggleMeEnabled()
        {
            _14_TimeMachine2.Models.USER user = new _14_TimeMachine2.Models.USER();
            user = db.USERs.Find(currentUser);
            user.toggle_status();
            db.SaveChanges();

            return (user.is_enabled() ? "You're now enabled" : "You're now disabled");
        }

    }
}
