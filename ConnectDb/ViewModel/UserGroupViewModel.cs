using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConnectDb.ViewModel
{
    public class UserGroupViewModel
    {
        public long UserID { get; set; }
        public string UserGroupName { get; set; }
        public string UserGroupID { get; set; }

        public string Phone { get; set; }
        public string UserName { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }
    }
}
