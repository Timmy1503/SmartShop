using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConnectDb.ViewModel
{
    public class ProductViewModel
    {
        public long ID { get; set; }
        public string Images { get; set; }
        public string MoreImage { get; set; }
        public string Name { get; set; }
        public decimal? Price { get; set; }

        public decimal? PromotionPrice { get; set; }
        public string CategoryName { get; set; }
        public string CategoryMetaTitle { get; set; }
        public string MetaTitle { get; set; }
        public DateTime? CreateDate { get; set; }
    }
}
