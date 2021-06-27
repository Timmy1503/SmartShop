namespace ConnectDb.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Role")]
    public partial class Role
    {
        [StringLength(250)]
        public string RoleID { get; set; }

        [StringLength(250)]
        public string RoleName { get; set; }
    }
}
