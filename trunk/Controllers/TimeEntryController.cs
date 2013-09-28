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
        private TM2Entities2 db2 = new TM2Entities2();

        //public string currentUser = GlobalVariables.current_user_id;
        public string currentUser = "mgeary";

        public ActionResult Index(string id = "")
        {
            //if((string.Compare(id, "") != 0))
            //    currentUser = id;
            var entries = db.ENTRies.Include(e => e.CATEGORY).Include(e => e.LOCATION).Include(e => e.PROJECT).Include(e => e.USER);
            List<ENTRY> entryList = new List<ENTRY>();

            //Replace hardcoded value with session username
            entryList = db.USERs.Find(currentUser).ENTRies.ToList();
            return View(entryList);
        }

        public ActionResult Details(int id = 0)
        {
            ENTRY entry = db.ENTRies.Find(id);
            if (entry == null)
            {
                return HttpNotFound();
            }
            return View(entry);
        }

        //
        // GET: /TimeEntry/Create

        public ActionResult Create()
        {
            ViewBag.entry_category_id = new SelectList(db.CATEGORies, "category_id", "category_name");
            ViewBag.entry_location_id = new SelectList(db.LOCATIONs, "location_id", "location_name");
            ViewBag.entry_project_id = new SelectList(db.USERs.Find(currentUser).getProjectsForUser(), "project_id", "project_name");
            return View();
        }

        //
        // POST: /TimeEntry/Create

        [HttpPost]
        public ActionResult Create(ENTRY entry)
        {
            DateTime startTime = DateTime.Parse(entry.entry_begin_time.ToString());
            DateTime endTime = DateTime.Parse(entry.entry_end_time.ToString());
            Double totalTime = endTime.Subtract(startTime).TotalMinutes;

            entry.entry_total_time = Convert.ToInt32(totalTime);
            entry.entry_user_id = currentUser;
            if (entry.entry_id == 4);
                
            if (ModelState.IsValid)            
            {
                db.ENTRies.Add(entry);
         
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.entry_category_id = new SelectList(db.CATEGORies, "category_id", "category_name", entry.entry_category_id);
            ViewBag.entry_location_id = new SelectList(db.LOCATIONs, "location_id", "location_name", entry.entry_location_id);
            ViewBag.entry_project_id = new SelectList(db.PROJECTs, "project_id", "project_name", entry.entry_project_id);

            return View(entry);
        }

        //
        // GET: /TimeEntry/Edit/5

        public ActionResult Edit(int id = 0)
        {
            ENTRY entry = db.ENTRies.Find(id);
            if (entry == null)
            {
                return HttpNotFound();
            }
            ViewBag.entry_category_id = new SelectList(db.CATEGORies, "category_id", "category_name", entry.entry_category_id);
            ViewBag.entry_location_id = new SelectList(db.LOCATIONs, "location_id", "location_name", entry.entry_location_id);
            ViewBag.entry_project_id = new SelectList(db.PROJECTs, "project_id", "project_name", entry.entry_project_id);
            ViewBag.entry_user_id = new SelectList(db.USERs, "user_id", "user_first_name", entry.entry_user_id);
            return View(entry);
        }

        //
        // POST: /TimeEntry/Edit/5

        [HttpPost]
        public ActionResult Edit(ENTRY entry)
        {
            Double totalTime = (DateTime.Parse(entry.entry_end_time.ToString()) - DateTime.Parse(entry.entry_begin_time.ToString())).TotalMinutes;

            entry.entry_total_time = Convert.ToInt32(totalTime);
            
            if (ModelState.IsValid)
            {
                db.Entry(entry).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.entry_category_id = new SelectList(db.CATEGORies, "category_id", "category_name", entry.entry_category_id);
            ViewBag.entry_location_id = new SelectList(db.LOCATIONs, "location_id", "location_name", entry.entry_location_id);
            ViewBag.entry_project_id = new SelectList(db.PROJECTs, "project_id", "project_name", entry.entry_project_id);
            ViewBag.entry_user_id = new SelectList(db.USERs, "user_id", "user_first_name", entry.entry_user_id);
            return View(entry);
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