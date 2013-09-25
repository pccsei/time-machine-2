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
            AuthConfig.RegisterAuth();
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