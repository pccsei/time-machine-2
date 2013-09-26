using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _14_TimeMachine2.Models;
using System.Security.Principal;

namespace _14_TimeMachine2.Filters
{
   public class AuthorizeStudentAttribute : ActionFilterAttribute
   {
      public override void OnActionExecuting(ActionExecutingContext filterContext)
      {
         // If the user is not a student, close the session
         if ((string) HttpContext.Current.Session["userIsStudent"] == "False")
             HttpContext.Current.Response.Redirect("http://eaglesnest.pcci.edu/studentlife/pathway/");
      }
   }
}