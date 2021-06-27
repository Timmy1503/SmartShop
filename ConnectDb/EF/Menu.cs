namespace ConnectDb.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Menu")]
    public partial class Menu
    {
        public int MenuID { get; set; }

        [StringLength(50)]
        public string MenuName { get; set; }

        [StringLength(50)]
        public string Link { get; set; }

        public long? ParentID { get; set; }

        public int? DisplayOrder { get; set; }

        [StringLength(50)]
        public string Target { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(250)]
        public string CreateBy { get; set; }

        public bool Status { get; set; }

        public int? MenuTypeID { get; set; }
    }
}
