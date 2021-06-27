using ConnectDb.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConnectDb.BLL
{
    public class MenuBLL
    {
        SmartShopDbContext db = null;
        public MenuBLL()
        {
            db = new SmartShopDbContext();
        }

        public List<MenuType> ListAll()
        {
            return db.MenuTypes.ToList();
        }

        public List<Menu> ListByGroupID(int groupId)
        {
            return db.Menus.Where(x => x.MenuTypeID == groupId && x.Status == true).OrderBy(x => x.DisplayOrder).ToList();
        }

        public Menu ViewDetail(long id)
        {
            return db.Menus.Find(id);
        }

        public long Insert(Menu entity)
        {
            db.Menus.Add(entity);
            db.SaveChanges();
            return entity.MenuID;
        }

        public IEnumerable<Menu> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Menu> model = db.Menus;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.MenuName.Contains(searchString));
            }
            return model.OrderBy(x => x.CreateDate).ToPagedList(page, pageSize);
        }

        public bool Update(Menu entity)
        {
            try
            {
                var menu = db.Menus.Find(entity.MenuID);
                menu.MenuName = entity.MenuName;
                menu.Link = entity.Link;
                menu.Status = entity.Status;
                menu.CreateBy = entity.CreateBy;
                menu.Target = entity.Target;
                menu.MenuTypeID = entity.MenuTypeID;
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
                var menu = db.Menus.Find(id);
                db.Menus.Remove(menu);
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
            var menu = db.Menus.Find(id);
            menu.Status = !menu.Status;
            db.SaveChanges();
            return menu.Status;
        }
    }
}
