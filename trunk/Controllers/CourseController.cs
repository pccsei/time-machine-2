using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _14_TimeMachine2.Models;
using _14_TimeMachine2.Filters;

namespace _14_TimeMachine2.Controllers
{
    [AuthorizeTeacher]
    public class CourseController : Controller
    {
        private TM2Entities2 db = new TM2Entities2();

        public string currentUser = GlobalVariables.current_user_id;
        //public string currentUser = "115245";

        //
        // GET: /Course/

        public ActionResult Index()
        {
            return View(db.USERs.Find(currentUser).getCoursesForUser().ToList());
        }

        //
        // GET: /Course/Details/5

        public ActionResult Details(int id = 0)
        {
            COURSE course = db.COURSEs.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        //
        // GET: /Course/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Course/Create

        [HttpPost]
        public ActionResult Create(COURSE course)
        {
            MEMBER member = new MEMBER();
            course.course_date_created = DateTime.Now;

            if (ModelState.IsValid)
            {
                course.course_is_enabled = 1;
                db.COURSEs.Add(course);
                db.SaveChanges();

                member.member_course_id = course.course_id;
                member.member_is_enabled = 1;
                member.member_position = "teacher";
                member.member_user_id = currentUser;

                db.MEMBERs.Add(member);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(course);
        }

        //
        // GET: /Course/Edit/5

        public ActionResult Edit(int id = 0)
        {
            COURSE course = db.COURSEs.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        //
        // POST: /Course/Edit/5

        [HttpPost]
        public ActionResult Edit(COURSE course)
        {
            if (ModelState.IsValid)
            {
                db.Entry(course).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(course);
        }

        //
        // GET: /Course/Delete/5

        //public ActionResult Delete(int id = 0)
        //{
        //    COURSE course = db.COURSEs.Find(id);
        //    if (course == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(course);
        //}

        ////
        //// POST: /Course/Delete/5

        //[HttpPost, ActionName("Delete")]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    COURSE course = db.COURSEs.Find(id);
        //    db.COURSEs.Remove(course);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        // ryoder [start]
        [HttpPost]
        public ActionResult ToggleEnabled(int id)
        {
            _14_TimeMachine2.Models.COURSE course = new _14_TimeMachine2.Models.COURSE();
            course = db.COURSEs.Find(id);
            course.toggle_status();
            db.SaveChanges();

            return View();
        }
        // ryoder [end]

    }
}