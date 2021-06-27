namespace ConnectDb.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HelpQuestion")]
    public partial class HelpQuestion
    {
        public long HelpQuestionID { get; set; }

        public string MetaTitle { get; set; }

        public string Description { get; set; }

        public int? DisplayOrder { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(250)]
        public string CreateBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(250)]
        public string ModifiedBy { get; set; }

        [StringLength(550)]
        public string MetaKeywords { get; set; }

        public string MetaDescriptions { get; set; }

        public bool Status { get; set; }
    }
}
