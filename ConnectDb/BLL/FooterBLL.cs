using ConnectDb.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConnectDb.BLL
{
    public class FooterBLL
    {
        SmartShopDbContext db = null;
        public FooterBLL()
        {
            db = new SmartShopDbContext();
        }

        public Footer GetFooter()
        {
            return db.Footers.SingleOrDefault(x => x.Status == true);
        }

        public Footer ViewDetail(long id)
        {
            return db.Footers.Find(id);
        }

        public string Insert(Footer entity)
        {
            db.Footers.Add(entity);
            db.SaveChanges();
            return entity.FooterID;
        }

        public IEnumerable<Footer> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Footer> model = db.Footers;
            //if (!string.IsNullOrEmpty(searchString))
            //{
            //    model = model.Where(x => x.DisplayOrder.Contains(searchString));
            //}
            return model.OrderBy(x => x.Status).ToPagedList(page, pageSize);
        }

        public bool Update(Footer entity)
        {
            try
            {
                var Footer = db.Footers.Find(entity.FooterID);
                Footer.Content = entity.Content;
                Footer.Status = entity.Status;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Delete(int id)
        {
            try
            {
                var Footer = db.Footers.Find(id);
                db.Footers.Remove(Footer);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool ChangeStatus(string id)
        {
            var Footer = db.Footers.Find(id);
            Footer.Status = !Footer.Status;
            db.SaveChanges();
            return Footer.Status;
        }
    }
}
