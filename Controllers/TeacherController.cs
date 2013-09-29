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
    [AuthorizeManager]
    public class TeacherController : Controller
    {
        //public string currentUser = GlobalVariables.current_user_id;
        public string currentUser = "115245";
        public string courseSelected;

        private TM2Entities2 db = new TM2Entities2();
        private TM2Entities2 db2 = new TM2Entities2();

        // This is the manager's default page. This should have the ability to 
        // view, enable, disable, and create teachers
        public ActionResult Index()
        {
            return View(db.USERs);
        }
                
        // HTML Helper that enables the controller to receive parameters from the View
        [HttpPost]
        public ActionResult Index(string firstName, string lastName, string userID)
        {
         
            USER newTeacher = new USER();

            if (ModelState.IsValid)
            {
                newTeacher.user_first_name = firstName;
                newTeacher.user_last_name  = lastName;
                newTeacher.user_id         = userID;
                newTeacher.user_is_teacher = 1;
                newTeacher.user_is_enabled = 1;
                newTeacher.user_is_manager = 0;
                newTeacher.user_is_student = 0;
                db.USERs.Add(newTeacher);

                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(db.USERs);
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
