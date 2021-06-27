using ConnectDb.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConnectDb.BLL
{
    public class HelpQuestionBLL
    {
        SmartShopDbContext db = null;

        public HelpQuestionBLL()
        {
            db = new SmartShopDbContext();
        }

        public List<HelpQuestion> ListAll()
        {
            return db.HelpQuestions.Where(x => x.Status == true).OrderBy(y => y.DisplayOrder).ToList();
        }

        public HelpQuestion ViewDetail(long id)
        {
            return db.HelpQuestions.Find(id);
        }

        public long Insert(HelpQuestion entity)
        {
            db.HelpQuestions.Add(entity);
            db.SaveChanges();
            return entity.HelpQuestionID;
        }

        public IEnumerable<HelpQuestion> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<HelpQuestion> model = db.HelpQuestions;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.MetaTitle.Contains(searchString));
            }
            return model.OrderBy(x => x.CreateDate).ToPagedList(page, pageSize);
        }

        public bool Update(HelpQuestion entity)
        {
            try
            {
                var help = db.HelpQuestions.Find(entity.HelpQuestionID);
                help.MetaTitle = entity.MetaTitle;
                help.Description = entity.Description;
                help.Status = entity.Status;
                help.CreateBy = entity.CreateBy;
                help.ModifiedBy = entity.ModifiedBy;
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
                var help = db.HelpQuestions.Find(id);
                db.HelpQuestions.Remove(help);
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
            var help = db.HelpQuestions.Find(id);
            help.Status = !help.Status;
            db.SaveChanges();
            return help.Status;
        }
    }
}
