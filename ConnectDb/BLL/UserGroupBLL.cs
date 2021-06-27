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
    public class UserGroupBLL
    {
        SmartShopDbContext db = null;

        public UserGroupBLL()
        {
            db = new SmartShopDbContext();
        }

        public List<UserGroup> ListAll()
        {
            return db.UserGroups.ToList();
        }

        public long Insert(User entity)
        {
            db.Users.Add(entity);
            db.SaveChanges();
            return entity.UserID;
        }

        public List<User> GetList(string UserName)
        {
            return db.Users.Where(x => x.UserGroupID == "ADMIN" && x.UserGroupID == "MOD").ToList();
        }

        public User ViewDetail(int id)
        {
            return db.Users.Find(id);
        }

        public IEnumerable<UserGroupViewModel> ListAllPaging(string searchString, int page, int pageSize)
        {
            //IQueryable<User> model = db.Users;
            //if (!string.IsNullOrEmpty(searchString))
            //{
            //    model = model.Where(x => x.UserName.Contains(searchString) || x.Name.Contains(searchString));
            //}
            var model = (from user in db.Users
                         join userGroup in db.UserGroups
                         on user.UserGroupID equals userGroup.UserGroupID
                         where userGroup.UserGroupID.Equals("ADMIN") || userGroup.UserGroupID.Equals("MOD")
                        select new UserGroupViewModel
                        {
                            UserID = user.UserID,
                            UserName = user.UserName,
                            Phone = user.Phone,
                            Name = user.Name,
                            UserGroupName = userGroup.UserGroupName,
                            Status = user.Status,
                            UserGroupID = userGroup.UserGroupID
                        }).AsEnumerable();
            return model.ToList();
        }

        public bool Update(User entity)
        {
            try
            {
                var user = db.Users.Find(entity.UserID);
                user.Name = entity.Name;
                if (!string.IsNullOrEmpty(entity.Password))
                {
                    user.Password = entity.Password;
                }
                user.UserGroupID = entity.UserGroupID;
                user.Phone = entity.Phone;
                user.Status = entity.Status;
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
                var user = db.Users.Find(id);
                db.Users.Remove(user);
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
            var user = db.Users.Find(id);
            user.Status = !user.Status;
            db.SaveChanges();
            return user.Status;
        }
    }
}
