using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Mvc;
using _14_TimeMachine2.Models;

namespace _14_TimeMachine2.Controllers
{
    public class TeacherController : Controller
    {
        //
        // GET: /Teacher/
        private TM2Entities db = new TM2Entities();
        // The default page for teacher's, includes summary information
        public ActionResult Index()
        {

            var courseQuery = db.COURSEs.Select(p => new { p.course_id, p.course_name });
            ViewBag.course_id = new SelectList(courseQuery.AsEnumerable(), "course_id", "course_name", 0);

            // Create and initialize a connection string to the database
            string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["TM2Connection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command_getSummary = new SqlCommand();

                // Give the command both the name of the stored procedure and specify the type of command - NPC 9/16/2013
                command_getSummary.CommandText = "tm_GetCourseSummary";
                command_getSummary.CommandType = CommandType.StoredProcedure;

                // Add parameters to the command to execute the stored procedure - NPC 9/16/2013
                command_getSummary.Parameters.AddWithValue("@courseID", 5);

                command_getSummary.Connection = connection;


                connection.Open();
                SqlDataReader user_reader = command_getSummary.ExecuteReader();
                connection.Close();
                //TM_DB.Dispose();
            }

            return View();
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
    }
}
