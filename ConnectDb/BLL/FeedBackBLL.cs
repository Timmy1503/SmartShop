using ConnectDb.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConnectDb.BLL
{
    public class FeedBackBLL
    {
        SmartShopDbContext db = null;

        public FeedBackBLL()
        {
            db = new SmartShopDbContext();
        }
        

        public FeedBack ViewDetail(long id)
        {
            return db.FeedBacks.Find(id);
        }

        public long Insert(FeedBack entity)
        {
            db.FeedBacks.Add(entity);
            db.SaveChanges();
            return entity.FeedBackID;
        }

        public IEnumerable<FeedBack> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<FeedBack> model = db.FeedBacks;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Email.Contains(searchString));
            }
            return model.OrderBy(x => x.CreateDate).ToPagedList(page, pageSize);
        }

        public bool Update(FeedBack entity)
        {
            try
            {
                var feedback = db.FeedBacks.Find(entity.FeedBackID);
                feedback.Email = entity.Email;
                feedback.Content = entity.Content;
                feedback.Status = entity.Status;
                feedback.CreateDate = entity.CreateDate;
                feedback.FeedBackName = entity.FeedBackName;
                feedback.Address = entity.Address;
                feedback.Phone = entity.Phone;
                feedback.Subject = entity.Subject;
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
                var feedback = db.FeedBacks.Find(id);
                db.FeedBacks.Remove(feedback);
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
            var feedback = db.FeedBacks.Find(id);
            feedback.Status = !feedback.Status;
            db.SaveChanges();
            return feedback.Status;
        }
    }
}
