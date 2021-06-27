using ConnectDb.EF;
using ConnectDb.ViewModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConnectDb.BLL
{
    public class ProductBLL
    {
        SmartShopDbContext db = null;

        public ProductBLL()
        {
            db = new SmartShopDbContext();
        }

        public List<Product> ListNewProduct(int top)
        {
            return db.Products.OrderBy(x => x.CreateDate).Take(top).ToList();
        }

        public List<Product> ListFeatureProduct(int top)
        {
            return db.Products.Where(x => x.TopHot != null && x.TopHot > DateTime.Now).OrderBy(x => x.CreateDate).Take(top).ToList();
        }

        public List<Product> ListSpecialProduct(int top)
        {
            return db.Products.Where(x=> x.MoreImage!= null && x.ProductID >= 15).ToList();
        }

        public Product ViewDetail(long id)
        {
            return db.Products.Find(id);
        }

        public List<Product> ListRelatedProduct(long productId)
        {
            return db.Products.Where(x => x.MoreImage != null && x.ProductID >= 15).ToList();
        }

        public List<Product> ListShop()
        {
            return db.Products.Where(x=>x.Image != null && x.CategoryID == 6).OrderBy(x=>x.CreateBy).ToList();
        }


        public List<Product> ListFamily()
        {
            return db.Products.Where(x => x.CategoryID == 9).ToList();
        }

        public List<Product> ListPersonal()
        {
            return db.Products.Where(x => x.CategoryID == 13).ToList();
        }

        public List<Product> ListFood()
        {
            return db.Products.Where(x => x.CategoryID == 18).ToList();
        }

        public List<Product> ListDrink()
        {
            return db.Products.Where(x => x.CategoryID == 25).ToList();
        }

        public List<Product> ListSpecial()
        {
            return db.Products.Where(x => x.CategoryID == 24).ToList();
        }

        public List<string> ListName(string keyword)
        {
            return db.Products.Where(x => x.ProductName.Contains(keyword)).Select(x => x.ProductName).ToList();
        }

        public List<ProductViewModel> Search(string keyword, ref int totalRecord, int pageIndex = 1, int pageSize = 2)
        {
            totalRecord = db.Products.Where(x => x.ProductName == keyword).Count();
            var model = (from a in db.Products
                         join b in db.ProductCategories
                         on a.CategoryID equals b.ProductCategoryID
                         where a.ProductName.Contains(keyword)
                         select new
                         {
                             CateMetaTitle = b.MetaTitle,
                             CateName = b.ProductCategoryName,
                             CreatedDate = a.CreateDate,
                             ID = a.ProductID,
                             Images = a.Image,
                             MoreImage = a.MoreImage,
                             Name = a.ProductName,
                             MetaTitle = a.SeoTitle,
                             Price = a.Price,
                             PromotionPrice = a.PromotionPrice
                         }).AsEnumerable().Select(x => new ProductViewModel()
                         {
                             CategoryMetaTitle = x.MetaTitle,
                             CategoryName = x.Name,
                             CreateDate = x.CreatedDate,
                             ID = x.ID,
                             Images = x.Images,
                             MoreImage = x.MoreImage,
                             Name = x.Name,
                             MetaTitle = x.MetaTitle,
                             PromotionPrice = x.PromotionPrice,
                             Price = x.Price
                         });
            model.OrderByDescending(x => x.CreateDate).Skip((pageIndex - 1) * pageSize).Take(pageSize);
            return model.ToList();
        }

        public long Insert(Product entity)
        {
            db.Products.Add(entity);
            db.SaveChanges();
            return entity.ProductID;
        }

        public IEnumerable<Product> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.ProductName.Contains(searchString) || x.Code.Contains(searchString));
            }
            return model.OrderBy(x => x.CreateDate).ToPagedList(page, pageSize);
        }

        public bool Update(Product entity)
        {
            try
            {
                var product = db.Products.Find(entity.ProductID);
                product.ProductName = entity.ProductName;
                product.Description = entity.Description;
                product.Code = product.Code;
                product.Origin = entity.Origin;
                product.SeoTitle = entity.SeoTitle;
                product.Quantity = entity.Quantity;
                product.Status = entity.Status;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public Product GetByID(long id)
        {
            return db.Products.Find(id);
        }

        public bool Delete(int id)
        {
            try
            {
                var product = db.Products.Find(id);
                db.Products.Remove(product);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public Product ViewDetail(int id)
        {
            return db.Products.Find(id);
        }

        public bool ChangeStatus(long id)
        {
            var product = db.Products.Find(id);
            product.Status = !product.Status;
            db.SaveChanges();
            return product.Status;
        }

        public List<ProductViewModel> ListByCategoryId(long categoryID, ref int totalRecord, int pageIndex = 1, int pageSize = 2)
        {
            totalRecord = db.Products.Where(x => x.CategoryID == categoryID).Count();
            var model = (from a in db.Products
                         join b in db.ProductCategories
                         on a.CategoryID equals b.ProductCategoryID
                         where a.CategoryID == categoryID
                         select new
                         {
                             CateMetaTitle = b.MetaTitle,
                             CateName = b.ProductCategoryName,
                             CreatedDate = a.CreateDate,
                             ID = a.ProductID,
                             Images = a.Image,
                             Name = a.ProductName,
                             MetaTitle = a.SeoTitle,
                             Price = a.Price
                         }).AsEnumerable().Select(x => new ProductViewModel()
                         {
                             CategoryMetaTitle = x.MetaTitle,
                             CategoryName = x.Name,
                             CreateDate = x.CreatedDate,
                             ID = x.ID,
                             Images = x.Images,
                             Name = x.Name,
                             MetaTitle = x.MetaTitle,
                             Price = x.Price
                         });
            model.OrderByDescending(x => x.CreateDate).Skip((pageIndex - 1) * pageSize).Take(pageSize);
            return model.ToList();
        }
    }
}
