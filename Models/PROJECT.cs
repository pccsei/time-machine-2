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
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    
    public partial class PROJECT
    {
        public PROJECT()
        {
            this.ENTRies = new HashSet<ENTRY>();
        }
        [Key]
        public int project_id { get; set; }
        [Required]
        [Display(Name = "Course")]
        public int project_course_id { get; set; }
        [Required]
        [StringLength(30, ErrorMessage = "Max 50 digits")]
        [Display(Name = "Project")]
        public string project_name { get; set; }
        [Required]
        [Display(Name = "Project Creator")]
        public string project_created_by { get; set; }
        [Required]
        [Display(Name = "Date Created")]
        public System.DateTime project_date_created { get; set; }
        //[Required]
        [Display(Name = "Description")]
        public string project_description { get; set; }
        //[Required]
        [Display(Name = "Begin Date")]
        public System.DateTime project_begin_date { get; set; }
        //[Required]
        [Display(Name = "End Date")]
        public System.DateTime project_end_date { get; set; }
        [Required]
        [Display(Name = "Enabled?")]
        public short project_is_enabled { get; set; }
    
        public virtual COURSE COURSE { get; set; }
        public virtual ICollection<ENTRY> ENTRies { get; set; }
        public virtual USER USER { get; set; }

        // ryoder [start]
        public bool is_enabled()
        {
            return (this.project_is_enabled == 1);
        }

        public void toggle_status()
        {
            this.project_is_enabled = (short)(this.project_is_enabled ^ 1);
            return;
        }

        // ryoder [end]

    }
}
