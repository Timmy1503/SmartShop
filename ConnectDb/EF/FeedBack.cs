namespace ConnectDb.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("FeedBack")]
    public partial class FeedBack
    {
        public int FeedBackID { get; set; }

        [StringLength(450)]
        public string FeedBackName { get; set; }

        [StringLength(50)]
        public string Phone { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        public string Address { get; set; }

        [StringLength(250)]
        public string Subject { get; set; }

        public string Content { get; set; }

        public DateTime? CreateDate { get; set; }

        public bool Status { get; set; }
    }
}
