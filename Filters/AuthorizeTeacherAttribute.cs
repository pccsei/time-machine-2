using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _14_TimeMachine2.Models;
using System.Security.Principal;

namespace _14_TimeMachine2.Filters
{
    public class AuthorizeTeacherAttribute : ActionFilterAttribute
    {        
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            // If the user is not a teacher, close the session
            if (!HttpContext.Current.Session["userType"].ToString().Equals("teacher"))
                HttpContext.Current.Response.Close();            
        }
    }
}
