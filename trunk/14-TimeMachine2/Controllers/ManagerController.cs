﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;

namespace _14_TimeMachine2.Controllers
{
    public class ManagerController : Controller
    {
        //
        // GET: /Manager/

        // This is the manager's default page. This should have the ability to 
        // view, enable, disable, and create teachers
        public ActionResult Index()
        {
            return View();
        }

        //public ActionResult NewTeacherMethod()
        //{
        //    return View();
        //}

        // HTML Helper that enables the controller to receive parameters from the V
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Index(string userID, string firstName, string lastName)
        {
            // Create and initialize a connection string to the database
            //string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SEI_TimeMachine2ConnectionString"].ConnectionString;
            string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["SEI_TimeMachine2ConnectionString"].ConnectionString;

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
            return View();
        }

    }
}
