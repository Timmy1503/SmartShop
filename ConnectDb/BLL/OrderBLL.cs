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
    public class OrderBLL
    {
        SmartShopDbContext db = null;
        public OrderBLL()
        {
            db = new SmartShopDbContext();
        }
        
        

        public Order ViewDetail(long id)
        {
            return db.Orders.Find(id);
        }

        public Order Detail(int? id)
        {
            return db.Orders.Find(id);
        }

        public long Insert(Order order)
        {
            db.Orders.Add(order);
            db.SaveChanges();
            return order.OrderID;
        }

        public IEnumerable<Order> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Order> model = db.Orders;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserName.Contains(searchString));
            }
            return model.OrderBy(x => x.CreatDate).ToPagedList(page, pageSize);
        }

        public bool Update(Order entity)
        {
            try
            {
                var order = db.Orders.Find(entity.OrderID);
                order.CreatDate = entity.CreatDate;
                order.UserName = entity.UserName;
                order.ShipName = entity.ShipName;
                order.ShipEmail = entity.ShipEmail;
                order.ShipMobile = entity.ShipMobile;
                order.ShipAddress = entity.ShipAddress;
                order.OrderID = entity.OrderID;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool Delete(int id)
        {
            try
            {
                var order = db.Orders.Find(id);
                db.Orders.Remove(order);
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
            var order = db.Orders.Find(id);
            order.Status = !order.Status;
            db.SaveChanges();
            return order.Status;
        }

    }
}
