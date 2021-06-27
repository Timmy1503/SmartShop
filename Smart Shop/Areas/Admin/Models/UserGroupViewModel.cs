using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Smart_Shop.Areas.Admin.Models
{
    public class UserGroupViewModel
    {
        public string UserGroupName { get; set; }
        public string UserGroupID { get; set; }

        public string Phone { get; set; }
        public string UserName { get; set; }
        public string Name { get; set; }
        public int Status { get; set; }
    }
}