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
        public ActionResult Index(string userID, string firstName, string lastName)
        {
            // Create and initialize a connection string to the database
            //string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SEI_TimeMachine2ConnectionString"].ConnectionString;
            string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["TM2Connection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command_CreateTeacher = new SqlCommand();

                // Give the command both the name of the stored procedure and specify the type of command - NPC 9/16/2013
                command_CreateTeacher.CommandText = "tm_CreateTeacher";
                command_CreateTeacher.CommandType = CommandType.StoredProcedure;

                // Add parameters to the command to execute the stored procedure - NPC 9/16/2013
                command_CreateTeacher.Parameters.AddWithValue("@userID", userID);
                command_CreateTeacher.Parameters.AddWithValue("@firstName", firstName);
                command_CreateTeacher.Parameters.AddWithValue("@lastName", lastName);

                //command_CreateTeacher.Parameters.Add(new SqlParameter("@userID", SqlDbType.VarChar)).Value = userID;
                //command_CreateTeacher.Parameters.Add(new SqlParameter("@firstName", SqlDbType.VarChar)).Value = firstName;
                //command_CreateTeacher.Parameters.Add(new SqlParameter("@lastName", SqlDbType.VarChar)).Direction = lastName;



                command_CreateTeacher.Connection = connection;


                connection.Open();
                SqlDataReader user_reader = command_CreateTeacher.ExecuteReader();
                connection.Close();
                //TM_DB.Dispose();
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
