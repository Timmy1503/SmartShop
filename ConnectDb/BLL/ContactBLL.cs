using ConnectDb.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConnectDb.BLL
{
    public class ContactBLL
    {
        SmartShopDbContext db = null;

        public ContactBLL()
        {
            db = new SmartShopDbContext();
        }

        public Contact GetActiveContact()
        {
            return db.Contacts.Single(x => x.Status == true);
        }

        public int InsertFeedBack(FeedBack fb)
        {
            db.FeedBacks.Add(fb);
            db.SaveChanges();
            return fb.FeedBackID;
        }
    }
}
