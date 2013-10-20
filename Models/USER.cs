//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace _14_TimeMachine2.Models
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.ComponentModel.DataAnnotations;
    
    public partial class USER
    {
        TM2Entities2 db = new TM2Entities2();

        public USER()
        {
            this.ENTRies = new HashSet<ENTRY>();
            this.MEMBERs = new HashSet<MEMBER>();
            this.PROJECTs = new HashSet<PROJECT>();
        }
    
        [Display(Name = "User ID")]
        public string user_id { get; set; }
        public Nullable<short> user_is_enabled { get; set; }
        [Display(Name = "First Name")]
        public string user_first_name { get; set; }
        [Display(Name = "Last Name")]
        public string user_last_name { get; set; }
        public Nullable<short> user_is_student { get; set; }
        public Nullable<short> user_is_teacher { get; set; }
        public Nullable<short> user_is_manager { get; set; }
    
        public virtual ICollection<ENTRY> ENTRies { get; set; }
        public virtual ICollection<MEMBER> MEMBERs { get; set; }
        public virtual ICollection<PROJECT> PROJECTs { get; set; }

        // ryoder [start]
        public bool is_student()
        {
            return (this.user_is_student == 1);
        }

        public bool is_teacher()
        {
            return (this.user_is_teacher == 1);
        }

        public bool is_manager()
        {
            return (this.user_is_manager == 1);
        }

        public bool is_enabled()
        {
            return (this.user_is_enabled == 1);
        }

        public void toggle_status()
        {
            this.user_is_enabled = (short)(this.user_is_enabled ^ 1);
            return;
        }

        public List<COURSE> getCoursesForUser()
        {
            List<COURSE> courseList = new List<COURSE>();

            foreach (MEMBER m in this.MEMBERs)
            {
                courseList.Add(db.COURSEs.Find(m.member_course_id));
            }

            return courseList;
        }

        public List<PROJECT> getProjectsForUser()
        {
            List<COURSE> courseList = new List<COURSE>();
            List<PROJECT> projectList = new List<PROJECT>();

            foreach (MEMBER m in this.MEMBERs)
            {
                courseList.Add(db.COURSEs.Find(m.member_course_id));
            }

            foreach (COURSE m in courseList)
            {
                projectList.AddRange(db.PROJECTs.Where(p => p.project_course_id == m.course_id));
            }

            return projectList;
        }

        public float[] getCourseStatsForStudent(int course_id)
        {
            var course   = db.COURSEs.Find(course_id);
            var projects = course.PROJECTs.ToList();

            float[] stats = new float[4] {0.0f, 0.0f, 0.0f, 0.0f};

            // Total hours
            foreach (ENTRY e in this.ENTRies)
            {
                if (projects.Find(
                        delegate(PROJECT p)
                        {
                            return p.project_id == e.entry_project_id;
                        }
                    ) != null)
                {
                    stats[0] += (float) e.entry_total_time / 60.0f;
                }
            }

            // Hours per day
            stats[1] = stats[0] / (float) (DateTime.Now - course.course_begin_date).Days;

            // Hours per week
            stats[2] = stats[1] * 7.0f;

            // Projected Grade
            stats[3] = stats[2] * (float) course.course_ref_grade / (float) course.course_ref_hours;

            return stats;
        }

        public Dictionary<string, string> getCourseStatsForStudentDictionary(int course_id)
        {
            float[] stats = this.getCourseStatsForStudent(course_id);

            Dictionary<string, string> dictionary = new Dictionary<string, string>();

            dictionary.Add("Total Hours", stats[0].ToString("n2"));
            dictionary.Add("Hours per Day", stats[1].ToString("n2"));
            dictionary.Add("Hours per Week", stats[2].ToString("n2"));
            dictionary.Add("Projected Grade", stats[3].ToString("n2") + "%");

            return dictionary;
        }

        public List<float> getWeeklyHoursForCourse(int course_id)
        {
            var course = db.COURSEs.Find(course_id);
            var projects = course.PROJECTs.ToList();

            int extraDays = course.course_submit_day + 1 - (int)course.course_begin_date.DayOfWeek; // Adding one to move boundary to end of day
            if (extraDays < 0)
                extraDays += 7;
            DateTime relStartDay = course.course_begin_date.AddDays(extraDays);

            List<int> projectIDs = new List<int>();
            foreach (PROJECT project in course.PROJECTs)
            {
                projectIDs.Add(project.project_id);
            }

            double currentDay = (DateTime.Today - relStartDay).TotalDays;
            int currentWeek = (int)Math.Floor(currentDay / 7.0) + 1;
            if (currentDay < 0.0) currentWeek = 1;

            List<float> weeks = new List<float>();
            for (int w = 1; w <= currentWeek; w++)
                weeks.Add(0.0f);

            foreach (ENTRY entry in this.ENTRies)
            {
                if (projectIDs.Contains((int)entry.entry_project_id))
                {
                    Double entryDay = ((DateTime)entry.entry_end_time - relStartDay).TotalDays;
                    int entryWeek = (int)Math.Floor(entryDay / 7.0) + 1;
                    if (entryDay < 0.0) entryWeek = 1;

                    weeks[entryWeek - 1] += (float) entry.entry_total_time / 60.0f;
                }
            }

            return weeks;
        }


        public class USER_SortByLastName : IComparer<USER>
        {

            #region IComparable<USER> Members

            public int Compare(USER x, USER y)
            {
                return string.Compare(x.user_last_name, y.user_last_name);
            }

            #endregion
        }
    }
}
