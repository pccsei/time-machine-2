using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using _14_TimeMachine2.Models;
using System.Web.UI.WebControls;
using System.Security.Principal;
using System.Web.SessionState;


namespace _14_TimeMachine2
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public static class GlobalVariables
    {
        private static int selected_course_id_stored;
        public static USER current_user
        {
            get
            {
                TM2Entities2 db = new TM2Entities2();
                return db.USERs.Find(current_user_id);
            }
        }

        public static string current_user_id
        {
            get
            {
                if (HttpContext.Current.Session["username"] == null)
                {
                    string current_login_id = HttpContext.Current.User.Identity.Name;
                    string current_user_id = current_login_id.Substring(current_login_id.LastIndexOf('\\') + 1);
                    HttpContext.Current.Session["username"] = current_user_id;
                }

                return (string)(HttpContext.Current.Session["username"]);//"rhowell";// "115339";// 
            }
        }

        public static COURSE selected_course
        {
            get
            {
                TM2Entities2 db = new TM2Entities2();
                return db.COURSEs.Find(selected_course_id);
            }
        }

        public static int selected_course_id
        {
            get
            {
                if (HttpContext.Current.Session["course"] == null)
                {
                    TM2Entities2 db = new TM2Entities2();
                    if (current_user.ENTRies.Count() > 0 && current_user.is_student())
                        selected_course_id_stored = current_user.ENTRies.Last().PROJECT.project_course_id;
                    else
                        selected_course_id_stored = current_user.MEMBERs.Last().member_course_id;
                }
                else
                {
                    selected_course_id_stored = (int)HttpContext.Current.Session["course"];
                }

                return selected_course_id_stored;
            }
            set
            {
                HttpContext.Current.Session["course"] = selected_course_id_stored = value;
            }
        }
    }

    public class MvcApplication : System.Web.HttpApplication
    {
        //private TM2Entities db = new TM2Entities();        

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            //AuthConfig.RegisterAuth();
        }

        /*
        protected void Application_BeginRequest()
        {


            TM2Entities db = new TM2Entities();
           // System.Web.HttpContext.Current.Session[
            try
            {
                string userId = "116730"; //HttpContext.Current.User.Identity.Name.Substring(HttpContext.Current.User.Identity.Name.LastIndexOf('\\') + 1).ToString();
                USER currentUser = new USER();
                currentUser = db.USERs.Find(userId);

                if (currentUser == null || !(currentUser.is_enabled()))
                    HttpContext.Current.Response.Close();
                else
                    if (currentUser.is_student())
                        this.Session.Add("userType", "student");//Session["userType"] = "student";
                    else if (currentUser.is_teacher())
                        this.Session["userType"] = "teacher";
                    else if (currentUser.is_manager())
                        this.Session["userType"] = "manager";
                    else
                        this.Session["userType"] = null;

                this.Session["username"] = userId;
                
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Redirect("http://eaglesnest.pcci.edu");
            }
        }
        */


        /*public int getUser()
        {
            _14_TimeMachine2.Models.USER user = new _14_TimeMachine2.Models.USER();
            try
            {
                user = db.USERs.Find(currentUser);
            }
            catch
            {
                return 1;
            }

            if (user.is_enabled())
            {
                if (user.is_manager())
                {

                    ///Direct to manager page
                    ///
                }
                else if (user.is_teacher())
                {
                   ///Direct to teacher
                   ///
                }
                else
                {
                   ///direct to student page
                   ///
                }
                Session["username"] = user;
            }
            else 
               Session["username"] = "User Not Enabled";
            return 0;
        }*/
    }
}