using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security.Principal;
using System.Web.Routing;

namespace _14_TimeMachine2.Filters
{
   public class AuthorizeManagerAttribute : ActionFilterAttribute
   {
      public override void OnActionExecuting(ActionExecutingContext filterContext)
      {
         // If the user is not a teacher, close the session
         if (!HttpContext.Current.Session["userType"].ToString().Equals("manager"))
            HttpContext.Current.Response.Close();         
      }
   }
}