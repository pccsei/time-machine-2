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
    
    public partial class USER
    {
        public USER()
        {
            this.ENTRies = new HashSet<ENTRY>();
            this.MEMBERs = new HashSet<MEMBER>();
        }
    
        public string user_id { get; set; }
        public Nullable<short> user_is_enabled { get; set; }
        public string user_first_name { get; set; }
        public string user_last_name { get; set; }
        public Nullable<short> user_is_student { get; set; }
        public Nullable<short> user_is_teacher { get; set; }
        public Nullable<short> user_is_manager { get; set; }
    
        public virtual ICollection<ENTRY> ENTRies { get; set; }
        public virtual ICollection<MEMBER> MEMBERs { get; set; }
    }
}
