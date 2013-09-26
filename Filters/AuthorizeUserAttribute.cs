using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using _14_TimeMachine2.Models;
using System.Web.Mvc;
using System.Data.Entity;


namespace _14_TimeMachine2.Filters
{
    public class AuthorizeUserAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            TM2Entities2 db = new TM2Entities2();
            // System.Web.HttpContext.Current.Session[
            try
            {
                string userId = "superuser"; //HttpContext.Current.User.Identity.Name.Substring(HttpContext.Current.User.Identity.Name.LastIndexOf('\\') + 1).ToString();
                //string userId = HttpContext.Current.User.Identity.Name.Substring(HttpContext.Current.User.Identity.Name.LastIndexOf('\\') + 1).ToString();
                USER currentUser = db.USERs.Find(userId);

                if (currentUser == null || !(currentUser.is_enabled()))
                    //HttpContext.Current.Response.Close();
                    HttpContext.Current.Response.Redirect("http://eaglesnest.pcci.edu/studentlife/pathway/");
                else
                {
                    HttpContext.Current.Session["userIsStudent"] = currentUser.is_student().ToString();// ? "yes" : "no";
                    HttpContext.Current.Session["userIsTeacher"] = currentUser.is_teacher().ToString();// ? "yes" : "no";
                    HttpContext.Current.Session["userIsManager"] = currentUser.is_manager().ToString();// ? "yes" : "no";
                    //if (currentUser.is_student())
                    //    HttpContext.Current.Session["userType"] = "student";//Session["userType"] = "student";
                    //if (currentUser.is_teacher())
                    //    HttpContext.Current.Session["userType"] = "teacher";
                    //if (currentUser.is_manager())
                    //    HttpContext.Current.Session["userType"] = "manager";
                    //else
                    //    HttpContext.Current.Session["userType"] = null;
                }

                HttpContext.Current.Session["username"] = userId;

            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Redirect("http://eaglesnest.pcci.edu");
            }
        }
    }
}