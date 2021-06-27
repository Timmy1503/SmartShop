namespace ConnectDb.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Order")]
    public partial class Order
    {
        public long OrderID { get; set; }

        public DateTime? CreatDate { get; set; }

        [StringLength(250)]
        public string UserName { get; set; }

        [StringLength(250)]
        public string ShipName { get; set; }

        [StringLength(250)]
        public string ShipMobile { get; set; }

        public string ShipAddress { get; set; }

        public string ShipEmail { get; set; }

        public bool Status { get; set; }
    }
}
