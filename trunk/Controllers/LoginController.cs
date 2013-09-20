using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using System.Data;
using System.DirectoryServices;

namespace _14_TimeMachine2.Controllers
{
    public class LoginController : Controller
    {

        //
        // GET: /Login/

        // Edited by Koffi and James Miyashita
        // Updated on: 9/19/13 5:36 P.M.

        string emptyString = "<br />"; // An empty string...
        public ActionResult Index()
        {
            return View();
        }

        /***************************************************************************************
        /*                                   Validate Login                                    * 
         * 
         */
        
        protected void submitLogin(string loginName, string loginPass, string lblLoginError)
        {

            Int32 intUserType = 0;
            Boolean userDisabled = false;

            using (DirectoryEntry entry = new DirectoryEntry())
            {
                entry.Username = loginName;
                entry.Password = loginPass;

                DirectorySearcher searcher = new DirectorySearcher(entry);

                searcher.Filter = "(objectclass=user)";


                // TEST code
                lblLoginError = entry.Username;
                return;



                try
                {
                    searcher.FindOne();
                }
                catch (DirectoryServicesCOMException ex)
                {
                    if (ex.ErrorCode == -2147023570) // Login or password is incorrect
                    {
                        lblLoginError = "Username or password was invalid.<br />";
                    }
                    return;
                }

            }

            if (lblLoginError == emptyString)
            {
                // Open DB connection
                SqlConnection TM_DB = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["SEI_TMConnString"].ConnectionString);
                TM_DB.Open();

                SqlCommand command_GetUser = new SqlCommand("tm_GetUser", TM_DB);
                command_GetUser.CommandType = CommandType.StoredProcedure;
                command_GetUser.Parameters.AddWithValue("@UserID", loginName);

                SqlDataReader user_reader = command_GetUser.ExecuteReader();

                //Get the first user returned
                if (user_reader.HasRows)
                {
                    while (user_reader.Read())
                    {
                        intUserType = (Int32)user_reader["TypeID"];
                        userDisabled = (user_reader["Disabled"].ToString() == "1");
                        break;
                    }
                }
                else
                {
                    lblLoginError = "You are not a current user. &nbsp;Please contact the administrator of Time Machine.<br />";
                }
                user_reader.Close();
                user_reader.Dispose();
                command_GetUser.Dispose();

                // Close DB connection
                TM_DB.Close();
                TM_DB.Dispose();

                if (userDisabled)
                    lblLoginError = "Your account is disabled. &nbsp;Please contact the administrator of Time Machine.<br />";

                if (lblLoginError == emptyString)
                {
                    Session["s_user"] = loginName;
                    if (intUserType >= 1)
                        Response.Redirect("Statistics.aspx");
                    else
                        Response.Redirect("Timelog.aspx");
                }
            }
        }





        //protected void testFields()
        [HttpPost]
        protected void testFields(object sender, EventArgs e)
        {
            //global loginName = "testing";
            return;
        }
        
    }
}
