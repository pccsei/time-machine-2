using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _14_TimeMachine2.Models
{
    public class DropDownSelectionModel
    {
        public int SelectedID { get; set; }

        public IEnumerable<SelectListItem> CategoryList { get; set; }
    }
}