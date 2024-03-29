﻿using System;
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

        public USER currentUser = GlobalVariables.current_user;

        //
        // GET: /Course/

        public ActionResult Index()
        {
            return View(currentUser.getCoursesForUser().ToList());
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
                member.member_user_id = currentUser.user_id;

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
                return HttpNotFound();
            else
                return View(course);
        }

        //
        // POST: /Course/Edit/5

        [HttpPost]
        public ActionResult Edit(COURSE edited_course)
        {
            // Remove PK from validation. Otherwise it will assume a duplicated key.
            ModelState.Remove("course_id");

            if (ModelState.IsValid && edited_course != null)
            {
                COURSE db_course = db.COURSEs.Find(edited_course.course_id);
                if (db_course != null)
                {
                    db.Entry(db_course).CurrentValues.SetValues(edited_course);
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            else
                return View(edited_course);
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