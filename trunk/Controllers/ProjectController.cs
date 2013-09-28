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
        public string currentUser = "mgeary";

        //
        // GET: /Project/

        public ActionResult Index()
        {
            var projects = db.PROJECTs.Include(p => p.COURSE).Include(p => p.USER);
            ViewBag.project_course_id = new SelectList(db.USERs.Find(currentUser).getCoursesForUser(), "course_id", "course_name");
            return View(projects.ToList());
        }

        [HttpPost]
        public ActionResult Index(string projectName, string projectDescription, int project_course_id)
        {
            PROJECT project = new PROJECT();
            COURSE  course  = new COURSE();

            if (ModelState.IsValid)
            {
                project.project_name = projectName;
                project.project_course_id = project_course_id;
                project.project_description = projectDescription;
                course = db.COURSEs.Find(project_course_id);
                project.project_created_by = currentUser;
                project.project_date_created = DateTime.Now;
                project.project_begin_date = DateTime.Now;
                project.project_end_date = course.course_end_date;
                project.project_is_enabled = 1;
    
                db.PROJECTs.Add(project);

                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.entry_project_id = new SelectList(db.USERs.Find(currentUser).getProjectsForUser(), "project_id", "project_name");
            ViewBag.course_id = new SelectList(db.USERs.Find(currentUser).getCoursesForUser(), "course_id", "course_name");
            return View(project);
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