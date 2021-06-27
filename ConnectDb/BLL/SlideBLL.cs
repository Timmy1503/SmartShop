using ConnectDb.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConnectDb.BLL
{
    public class SlideBLL
    {
        SmartShopDbContext db = null;

        public SlideBLL()
        {
            db = new SmartShopDbContext();
        }

        public List<Slide> ListAll()
        {
            return db.Slides.Where(x => x.Status == true).OrderBy(y => y.DisplayOrder).ToList();
        }

        public List<Slide> ListTopSlide(int top)
        {
            return db.Slides.Where(x => x.ParentID == 2 && x.Status == true).ToList();
        }

        public Slide ViewDetail(long id)
        {
            return db.Slides.Find(id);
        }

        public long Insert(Slide entity)
        {
            db.Slides.Add(entity);
            db.SaveChanges();
            return entity.SlideID;
        }

        public IEnumerable<Slide> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Slide> model = db.Slides;
            //if (!string.IsNullOrEmpty(searchString))
            //{
            //    model = model.Where(x => x.DisplayOrder.Contains(searchString));
            //}
            return model.OrderBy(x => x.CreateDate).ToPagedList(page, pageSize);
        }

        public bool Update(Slide entity)
        {
            try
            {
                var slide = db.Slides.Find(entity.SlideID);
                slide.Image = entity.Image;
                slide.ParentID = entity.ParentID;
                slide.Status = entity.Status;
                slide.Description = entity.Description;
                slide.CreateBy = entity.CreateBy;
                slide.ModifiedBy = entity.ModifiedBy;
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
                var slide = db.Slides.Find(id);
                db.Slides.Remove(slide);
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
            var slide = db.Slides.Find(id);
            slide.Status = !slide.Status;
            db.SaveChanges();
            return slide.Status;
        }
    }
}
