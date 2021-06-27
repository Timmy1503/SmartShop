using ConnectDb.EF;
using ConnectDb.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConnectDb.BLL
{
    public class OrderDetailBLL
    {
        SmartShopDbContext db = null;
        public OrderDetailBLL()
        {
            db = new SmartShopDbContext();
        }

        public bool Insert(OrderDetail detail)
        {
            try
            {
                db.OrderDetails.Add(detail);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;

            }
        }

        //public List<ViewDetail> Detail(int id)
        //{
        //    var model = (from order in db.Orders
        //                 join orderDetail in db.OrderDetails
        //                 on order.OrderID equals orderDetail.OrderID
        //                 select new
        //                 {
        //                     OrderID = order.OrderID,
        //                     Quantity = orderDetail.Quantity,
        //                     Price = orderDetail.Price,
        //                     UserName = order.UserName,
        //                     ShipName = order.ShipName,
        //                     ShipAddress = order.ShipAddress,
        //                     ShipEmail = order.ShipEmail,
        //                     ShipPhone = order.ShipMobile,
        //                     CreateDate = order.CreatDate,
        //                     Status = order.Status
        //                 }).AsQueryable();

        //    return model.OrderBy(x=>x.UserName);
        //}
    }
}
