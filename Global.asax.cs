using _14_TimeMachine2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using _14_TimeMachine2.Controllers;


namespace _14_TimeMachine2
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterAuth();
        }

        //public bool userCheck()
        //{
        //    TM2Entities2 db = new TM2Entities2();
        //    var userID = 117567;
        //    USER currentUser = db.USERs.Find(userID);

        //    if (currentUser.user_is_enabled == 1)
        //        return true;
        //    else
        //        return false;

        //}
    }
}