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
    
    public partial class PROJECT
    {
        public PROJECT()
        {
            this.ENTRies = new HashSet<ENTRY>();
        }
    
        public int project_id { get; set; }
        public int project_course_id { get; set; }
        public string project_name { get; set; }
        public string project_created_by { get; set; }
        public System.DateTime project_date_created { get; set; }
        public string project_description { get; set; }
        public System.DateTime project_begin_date { get; set; }
        public System.DateTime project_end_date { get; set; }
        public short project_is_enabled { get; set; }
    
        public virtual COURSE COURSE { get; set; }
        public virtual ICollection<ENTRY> ENTRies { get; set; }
        public virtual USER USER { get; set; }
    }
}
