namespace ConnectDb.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        public long ProductID { get; set; }

        [StringLength(250)]
        public string ProductName { get; set; }

        [StringLength(50)]
        public string Code { get; set; }

        [StringLength(250)]
        public string SeoTitle { get; set; }

        public string Description { get; set; }

        public string Image { get; set; }

        
        public string MoreImage { get; set; }

        public decimal? Price { get; set; }

        public decimal? PromotionPrice { get; set; }

        public string SaveImage { get; set; }

        public int? Quantity { get; set; }

        public long? CategoryID { get; set; }

        [StringLength(250)]
        public string Origin { get; set; }

        public int? Warranty { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(250)]
        public string CreateBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(250)]
        public string ModifiedBy { get; set; }

        [StringLength(250)]
        public string MetaKeywords { get; set; }

        [StringLength(250)]
        public string MetaDescriptions { get; set; }

        public bool Status { get; set; }

        public DateTime? TopHot { get; set; }

        public int? ViewCount { get; set; }
    }
}
