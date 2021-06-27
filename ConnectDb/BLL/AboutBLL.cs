using ConnectDb.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConnectDb.BLL
{
    public class AboutBLL
    {
        SmartShopDbContext db = null;
        public AboutBLL()
        {
            db = new SmartShopDbContext();
        }

        public List<About> ListAll()
        {
            return db.Abouts.Where(x => x.Status == true).ToList();
        }

        public About ViewDetail(long id)
        {
            return db.Abouts.Find(id);
        }

        public IEnumerable<About> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<About> model = db.Abouts;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.AboutName.Contains(searchString));
            }
            return model.OrderBy(x => x.CreateDate).ToPagedList(page, pageSize);
        }

        public long Insert(About entity)
        {
            db.Abouts.Add(entity);
            db.SaveChanges();
            return entity.AboutID;
        }

        public bool Update(About entity)
        {
            try
            {
                var about = db.Abouts.Find(entity.AboutID);
                about.AboutName = entity.AboutName;
                about.MetaTitle = entity.MetaTitle;
                about.Description = entity.Description;
                about.Image = entity.Image;
                about.Status = entity.Status;
                about.CreateBy = entity.CreateBy;
                about.ModifiedBy = entity.ModifiedBy;
                db.SaveChanges();
                return true;
            }
            catch(Exception)
            {
                return false;
            }
        }

        public bool Delete(int id)
        {
            try
            {
                var about = db.Abouts.Find(id);
                db.Abouts.Remove(about);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool ChangeStatus(long id)
        {
            var about = db.Abouts.Find(id);
            about.Status = !about.Status;
            db.SaveChanges();
            return about.Status;
        }
    }
}
