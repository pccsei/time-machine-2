﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Mvc;
using _14_TimeMachine2.Models;
using System.Web.Mvc.Html;
using System.Web.UI.WebControls;
using System.Data.Entity;
using _14_TimeMachine2.Filters;

namespace _14_TimeMachine2.Controllers
{
    [AuthorizeBoth]
    public class TimeEntryController : Controller
    {
        private TM2Entities2 db = new TM2Entities2();
        private USER   currentUser   = GlobalVariables.current_user;
        private COURSE currentCourse = GlobalVariables.selected_course;

        public ActionResult Index(string id = null)
        {
            USER student = currentUser;

            if (currentUser.is_teacher())
            {
                if (id == null || db.USERs.Find(id) == null)
                {
                    if (!currentUser.is_student())
                        return RedirectToAction("Index", "Welcome");
                }
                else
                    student = db.USERs.Find(id);
            }

            //List<ENTRY> active_student_entries = student.ENTRies.ToList();

            // // Filter out entries from disabled projects and courses
            // foreach (PROJECT p in student.getProjects())
            // {
            //     if (p.project_is_enabled == 0 || p.COURSE.course_is_enabled == 0)
            //         foreach (ENTRY e in student.ENTRies.Where(t => t.entry_project_id == p.project_id))
            //             active_student_entries.Remove(e);
            // }

            return View(student.getEntries());
        }

        public ActionResult Details(int id = 0)
        {
            ENTRY entry = db.ENTRies.Find(id);
            if (entry == null)
                return HttpNotFound();
            // Students can see only their own entries, teachers see all
            else if (currentUser.is_teacher() || entry.entry_user_id == currentUser.user_id)
                return View(entry);
            else
                return RedirectToAction("Index", "Welcome");
        }

        //
        // GET: /TimeEntry/Create

        public ActionResult Create()
        {
            // Redirect to Time Log if a user tries to enter time on a disabled project
            if (currentCourse.course_is_enabled == 0)
                return RedirectToAction("Index");

            ENTRY last_entry;
            if (currentUser.getEntries().Count() > 0)
                last_entry = currentUser.getEntries().Last();
            else
                last_entry = new ENTRY();

            ViewBag.entry_category_id = new SelectList(db.CATEGORies, "category_id", "category_name", last_entry.entry_category_id);
            ViewBag.entry_location_id = new SelectList(db.LOCATIONs, "location_id", "location_name", last_entry.entry_location_id);
            ViewBag.entry_project_id = new SelectList(currentUser.getProjects(), "project_id", "project_name", last_entry.entry_project_id);
            ViewBag.entry_user_id = new SelectList(db.USERs, "user_id", "user_first_name");
            return View();
        }

        //
        // POST: /TimeEntry/Create

        [HttpPost]
        public ActionResult Create(ENTRY entry)
        {
            try
            {
                DateTime startTime = DateTime.Parse(entry.entry_begin_time.ToString());
                DateTime endTime = DateTime.Parse(entry.entry_end_time.ToString());
                Double totalTime = endTime.Subtract(startTime).TotalMinutes;
                DateTime course_begin = DateTime.Parse(currentCourse.course_begin_date.ToString());
                DateTime course_end = DateTime.Parse(currentCourse.course_end_date.ToString());

                // See if the entry is overlapping a previous entry
                List<ENTRY> entryList = new List<ENTRY>();
                entryList = currentUser.ENTRies.ToList();
                bool boundaryError = false;

                // Rob's validation, based on Jake's work
                if (startTime < course_begin ||
                    startTime > course_end ||
                    endTime < course_begin ||
                    endTime > course_end)
                    ModelState.AddModelError("ProjectBoundaryError", "Your time entry is not within the course begin and end dates.");
                else if (startTime > endTime)
                    ModelState.AddModelError("NegativeTimeError", "The end time comes before the start time.");
                else if (startTime == endTime)
                    ModelState.AddModelError("NoTimeError", "The end time is the same as the start time.");
                else
                {
                    foreach (var currentEntry in entryList)
                    {
                        if ((currentEntry.entry_begin_time <= startTime && startTime < currentEntry.entry_end_time) || // If startTime is within another entry's time
                            (currentEntry.entry_begin_time < endTime && endTime <= currentEntry.entry_end_time) ||     // If endTime is within another entry's time
                            (startTime <= currentEntry.entry_begin_time && currentEntry.entry_end_time <= endTime))    // If another entry's time is within the new time
                            boundaryError = true;
                    }
                    if (boundaryError)
                        ModelState.AddModelError("TimeBoundaryError", "The time entered overlaps a previously entered time.");
                }

                entry.entry_total_time = Convert.ToInt32(totalTime);
            }
            catch
            {
                ModelState.AddModelError("MissingTimeError", "Invalid time format.");
            }

            entry.entry_user_id = currentUser.user_id;
            ModelState.Remove("entry_id");

            if (ModelState.IsValid)            
            {
                db.ENTRies.Add(entry);
                db.SaveChanges();
                return RedirectToAction("Details", new { id = db.Entry(entry).Entity.entry_id });
            }

            ViewBag.timespan = Request.Form["timespan"];
            ViewBag.entry_category_id = new SelectList(db.CATEGORies, "category_id", "category_name", entry.entry_category_id);
            ViewBag.entry_location_id = new SelectList(db.LOCATIONs, "location_id", "location_name", entry.entry_location_id);
            ViewBag.entry_project_id = new SelectList(currentUser.getProjects(), "project_id", "project_name", entry.entry_project_id);
            ViewBag.entry_user_id = new SelectList(db.USERs, "user_id", "user_first_name", entry.entry_user_id);
            return View(entry);
        }

        //
        // GET: /TimeEntry/Edit/5

        public ActionResult Edit(int id = 0)
        {
            ENTRY entry = db.ENTRies.Find(id);
            if (entry == null)
                return HttpNotFound();
            // Students can edit only their own entries, teachers can edit all
            else if (currentUser.is_teacher() || entry.entry_user_id == currentUser.user_id)
            {
                ViewBag.entry_category_id = new SelectList(db.CATEGORies, "category_id", "category_name", entry.entry_category_id);
                ViewBag.entry_location_id = new SelectList(db.LOCATIONs, "location_id", "location_name", entry.entry_location_id);
                ViewBag.entry_project_id = new SelectList(currentUser.getProjects(), "project_id", "project_name", entry.entry_project_id);
                ViewBag.entry_user_id = new SelectList(db.USERs, "user_id", "user_first_name", entry.entry_user_id);
                return View(entry);
            }
            else
                return RedirectToAction("Index", "Welcome");
        }

        //
        // POST: /TimeEntry/Edit/5

        [HttpPost]
        public ActionResult Edit(ENTRY edited_entry)
        {
            DateTime startTime = DateTime.Parse(edited_entry.entry_begin_time.ToString());
            DateTime endTime = DateTime.Parse(edited_entry.entry_end_time.ToString());
            Double totalTime = (DateTime.Parse(edited_entry.entry_end_time.ToString()) - DateTime.Parse(edited_entry.entry_begin_time.ToString())).TotalMinutes;

            // See if the entry is overlapping a previous entry
            List<ENTRY> entryList = new List<ENTRY>();
            entryList = currentUser.ENTRies.ToList();
            bool boundaryError = false;

            // Rob's validation, based on Jake's work
            if (startTime > endTime)
                ModelState.AddModelError("NegativeTimeError", "The end time comes before the start time.");
            else if (startTime == endTime)
                ModelState.AddModelError("NoTimeError", "The end time is the same as the start time.");
            else
            {
                foreach (var currentEntry in entryList)
                {
                    if ((currentEntry.entry_id != edited_entry.entry_id) &&                                        // Don't check edited time against previous time
                       ((currentEntry.entry_begin_time <= startTime && startTime < currentEntry.entry_end_time) || // If startTime is within another entry's time
                        (currentEntry.entry_begin_time < endTime && endTime <= currentEntry.entry_end_time) ||     // If endTime is within another entry's time
                        (startTime <= currentEntry.entry_begin_time && currentEntry.entry_end_time <= endTime)))   // If another entry's time is within the new time
                        boundaryError = true;
                }
                if (boundaryError)
                    ModelState.AddModelError("TimeBoundaryError", "The time entered overlaps a previously entered time.");
            }

            // Recalculate the total time.
            edited_entry.entry_total_time = Convert.ToInt32(totalTime);

            // Remove PK from validation. Otherwise it will assume a duplicated key.
            ModelState.Remove("entry_id");
            
            if (ModelState.IsValid)
            {
                ENTRY db_entry = db.ENTRies.Find(edited_entry.entry_id);
                db.Entry(db_entry).CurrentValues.SetValues(edited_entry);
                db.SaveChanges();
                return RedirectToAction("Details", new { id = db_entry.entry_id });
            }

            ViewBag.entry_category_id = new SelectList(db.CATEGORies, "category_id", "category_name", edited_entry.entry_category_id);
            ViewBag.entry_location_id = new SelectList(db.LOCATIONs, "location_id", "location_name", edited_entry.entry_location_id);
            ViewBag.entry_project_id = new SelectList(currentUser.getProjects(), "project_id", "project_name", edited_entry.entry_project_id);
            ViewBag.entry_user_id = new SelectList(db.USERs, "user_id", "user_first_name", edited_entry.entry_user_id);
            
            return View(edited_entry);
        }

        //
        // GET: /TimeEntry/Delete/5

        public ActionResult Delete(int id = 0)
        {
            ENTRY entry = db.ENTRies.Find(id);
            if (entry == null)
            {
                return HttpNotFound();
            }
            return View(entry);
        }

        //
        // POST: /TimeEntry/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            ENTRY entry = db.ENTRies.Find(id);
            db.ENTRies.Remove(entry);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}