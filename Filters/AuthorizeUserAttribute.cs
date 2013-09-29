using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using _14_TimeMachine2.Models;
using System.Web.Mvc;
using System.Data.Entity;
using System.Web.Routing;


namespace _14_TimeMachine2.Filters
{
    public class AuthorizeUserAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            TM2Entities2 db = new TM2Entities2();

            try
            {
                string userId = (string)HttpContext.Current.Session["username"];
                USER currentUser = db.USERs.Find(userId);
                string error = HttpContext.Current.Request.Path;

                HttpContext.Current.Session["userIsStudent"] = false;
                HttpContext.Current.Session["userIsTeacher"] = false;
                HttpContext.Current.Session["userIsManager"] = false;

                if (error != "/Error")
                {
                    if (currentUser == null || !currentUser.is_enabled())
                    {
                        filterContext.Result = new RedirectToRouteResult(
                        new RouteValueDictionary { { "controller", "Error" }, { "action", "Index" } });

                    }
                    else
                    {
                        HttpContext.Current.Session["userIsStudent"] = currentUser.is_student();
                        HttpContext.Current.Session["userIsTeacher"] = currentUser.is_teacher();
                        HttpContext.Current.Session["userIsManager"] = currentUser.is_manager();
                    }
                }

            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Redirect("http://csmain/seproject/development/resources/500.htm");
            }
        }
    }
}