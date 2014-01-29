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
    public class ProjectController : Controller
    {
        private TM2Entities2 db = new TM2Entities2();

        private USER currentUser = GlobalVariables.current_user;
        private COURSE currentCourse = GlobalVariables.selected_course;

        //
        // GET: /Project/

        public ActionResult Index()
        {
            //var projects = db.PROJECTs.Include(p => p.COURSE).Include(p => p.USER);
            //ViewBag.project_course_id = new SelectList(currentUser.getCoursesForUser(), "course_id", "course_name");
            return View();
        }

        [HttpPost]
        public ActionResult Index(string projectName, string projectDescription)
        {
            PROJECT project = new PROJECT();

            project.project_name = projectName;
            project.project_course_id = currentCourse.course_id;
            project.project_description = projectDescription;
            project.project_created_by = currentUser.user_id;
            project.project_date_created = DateTime.Now;
            project.project_begin_date = DateTime.Now;
            project.project_end_date = currentCourse.course_end_date;
            project.project_is_enabled = 1;

            if (ModelState.IsValid)
            {
                db.PROJECTs.Add(project);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(project);
        }

        //
        // GET: /Project/Details/5

        public ActionResult Details(int id = 0)
        {
            PROJECT project = db.PROJECTs.Find(id);

            if (project == null)
                return HttpNotFound();

            return View(project);
        }

        //
        // GET: /Project/Edit/5

        public ActionResult Edit(int id = 0)
        {
            PROJECT project = db.PROJECTs.Find(id);

            if (project == null)
                return HttpNotFound();

            ViewBag.project_course_id = new SelectList(db.COURSEs, "course_id", "course_name", project.project_course_id);
            ViewBag.project_created_by = currentUser.user_id;
            return View(project);
        }

        //
        // POST: /Project/Edit/5

        [HttpPost]
        public ActionResult Edit(PROJECT project)
        {
            //project.project_created_by = currentUser.user_id;
            if (ModelState.IsValid)
            {
                db.Entry(project).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.project_course_id = new SelectList(db.COURSEs, "course_id", "course_name", project.project_course_id);
            ViewBag.project_created_by = currentUser.user_id;
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