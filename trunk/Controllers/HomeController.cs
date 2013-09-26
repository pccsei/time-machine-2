using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.DirectoryServices;

namespace _14_TimeMachine2.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

            return View();
        }

        
            [HttpPost]
            protected void LoginButtonClick(object sender, EventArgs e)
            {
                Int32 intUserType = 0;
                Boolean userDisabled = false;

            using (DirectoryEntry entry = new DirectoryEntry())
            {
                entry.Username = "117567";
                entry.Password = "01071674";

                DirectorySearcher searcher = new DirectorySearcher(entry);

                searcher.Filter = "(objectclass=user)";

                //try
                //{
                searcher.FindOne();
                //}
                //catch (DirectoryServicesCOMException ex)
                //{
                //if (ex.ErrorCode == -2147023570) // Login or password is incorrect
                //{
                //   lbl_error_message.Text = "Username or password was invalid.<br />";
                //}
                return;
                //}
            }
        }

        //public ActionResult About()
        //{
        //    ViewBag.Message = "Your app description page.";

        //    return View();
        //}

        //public ActionResult Contact()
        //{
        //    ViewBag.Message = "Your contact page.";

        //    return View();
        //}

        public ActionResult TimeLog()
        {
            return View();
        }
        // Controller to student add time entry page - NPC
        public ActionResult TimeEntry()
        {
            return View();
        }
    }

}
