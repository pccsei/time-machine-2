using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _14_TimeMachine2.Models;
using System.Security.Principal;
using System.Web.Routing;

namespace _14_TimeMachine2.Filters
{
   public class AuthorizeStudentAttribute : ActionFilterAttribute
   {
      public override void OnActionExecuting(ActionExecutingContext filterContext)
      {
         // If the user is not a student, close the session
         if (!(bool) HttpContext.Current.Session["userIsStudent"])
             filterContext.Result = new RedirectToRouteResult(
                 new RouteValueDictionary { { "controller", "Error" }, { "action", "Index" } });
      }
   }
}