using ConnectDb.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConnectDb.BLL
{
    public class ProductCategoryBLL
    {
        SmartShopDbContext db = null;
        public ProductCategoryBLL()
        {
            db = new SmartShopDbContext();
        }

        public List<ProductCategory> ListAll()
        {
            return db.ProductCategories.Where(x => x.Status == true).OrderBy(x => x.DisplayOrder).ToList();
        }

        public ProductCategory ViewDetail(long id)
        {
            return db.ProductCategories.Find(id);
        }
    }
}
