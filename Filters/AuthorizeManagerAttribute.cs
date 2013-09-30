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
         // Deny current user if he is not a manager
          if (!(bool)HttpContext.Current.Session["userIsManager"])
              filterContext.Result = new RedirectToRouteResult(
                  new RouteValueDictionary { { "controller", "ManagerError" }, { "action", "Index" } });
      }
   }
}