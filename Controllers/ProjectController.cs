using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _14_TimeMachine2.Models;

namespace _14_TimeMachine2.Controllers
{
    public class ProjectController : Controller
    {
        private TM2Entities2 db = new TM2Entities2();

        //
        // GET: /Project/

        public ActionResult Index()
        {
            var projects = db.PROJECTs.Include(p => p.COURSE).Include(p => p.USER);
            return View(projects.ToList());
        }

        //
        // GET: /Project/Details/5

        public ActionResult Details(int id = 0)
        {
            PROJECT project = db.PROJECTs.Find(id);
            if (project == null)
            {
                return HttpNotFound();
            }
            return View(project);
        }

        //
        // GET: /Project/Create

        public ActionResult Create()
        {
            ViewBag.project_course_id = new SelectList(db.COURSEs, "course_id", "course_name");
            ViewBag.project_created_by = new SelectList(db.USERs, "user_id", "user_first_name");
            return View();
        }

        //
        // POST: /Project/Create

        [HttpPost]
        public ActionResult Create(PROJECT project)
        {
            if (ModelState.IsValid)
            {
                db.PROJECTs.Add(project);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.project_course_id = new SelectList(db.COURSEs, "course_id", "course_name", project.project_course_id);
            ViewBag.project_created_by = new SelectList(db.USERs, "user_id", "user_first_name", project.project_created_by);
            return View(project);
        }

        //
        // GET: /Project/Edit/5

        public ActionResult Edit(int id = 0)
        {
            PROJECT project = db.PROJECTs.Find(id);
            if (project == null)
            {
                return HttpNotFound();
            }
            ViewBag.project_course_id = new SelectList(db.COURSEs, "course_id", "course_name", project.project_course_id);
            ViewBag.project_created_by = new SelectList(db.USERs, "user_id", "user_first_name", project.project_created_by);
            return View(project);
        }

        //
        // POST: /Project/Edit/5

        [HttpPost]
        public ActionResult Edit(PROJECT project)
        {
            if (ModelState.IsValid)
            {
                db.Entry(project).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.project_course_id = new SelectList(db.COURSEs, "course_id", "course_name", project.project_course_id);
            ViewBag.project_created_by = new SelectList(db.USERs, "user_id", "user_first_name", project.project_created_by);
            return View(project);
        }

        //
        // GET: /Project/Delete/5

        public ActionResult Delete(int id = 0)
        {
            PROJECT project = db.PROJECTs.Find(id);
            if (project == null)
            {
                return HttpNotFound();
            }
            return View(project);
        }

        //
        // POST: /Project/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            PROJECT project = db.PROJECTs.Find(id);
            db.PROJECTs.Remove(project);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        // ryoder [start]
        [HttpPost]
        public ActionResult ToggleEnabled(int id)
        {
            _14_TimeMachine2.Models.PROJECT project = new _14_TimeMachine2.Models.PROJECT();
            project = db.PROJECTs.Find(id);
            project.toggle_status();
            db.SaveChanges();

            return View();
        }
        // ryoder [end]
    }
}