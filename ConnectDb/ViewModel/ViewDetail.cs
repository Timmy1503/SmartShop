using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConnectDb.ViewModel
{
    public class ViewDetail
    {
        public long ProductID { get; set; }
        public int? Quantity { get; set; }

        public decimal? Price { get; set; }
    }
}
