using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _14_TimeMachine2.Models;
using System.Security.Principal;

namespace _14_TimeMachine2.Filters
{
    public class AuthorizeBothAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            // If the user is not a teacher, redirect
            if (!(bool)HttpContext.Current.Session["userIsTeacher"] && !(bool)HttpContext.Current.Session["userIsStudent"])
                HttpContext.Current.Response.Redirect("http://eaglesnest.pcci.edu/studentlife/pathway/");
        }
    }
}
