namespace ConnectDb.EF
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class SmartShopDbContext : DbContext
    {
        public SmartShopDbContext()
            : base("name=SmartShopDbContext")
        {
        }

        public virtual DbSet<About> Abouts { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<Credential> Credentials { get; set; }
        public virtual DbSet<FeedBack> FeedBacks { get; set; }
        public virtual DbSet<Footer> Footers { get; set; }
        public virtual DbSet<HelpQuestion> HelpQuestions { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<MenuType> MenuTypes { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductCategory> ProductCategories { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Slide> Slides { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserGroup> UserGroups { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Footer>()
                .Property(e => e.FooterID)
                .IsUnicode(false);

            modelBuilder.Entity<OrderDetail>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Product>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Product>()
                .Property(e => e.PromotionPrice)
                .HasPrecision(18, 0);

            modelBuilder.Entity<User>()
                .Property(e => e.UserGroupID)
                .IsUnicode(false);

            modelBuilder.Entity<UserGroup>()
                .Property(e => e.UserGroupID)
                .IsFixedLength();
        }

        public System.Data.Entity.DbSet<ConnectDb.ViewModel.ProductViewModel> ProductViewModels { get; set; }

        //public System.Data.Entity.DbSet<Smart_Shop.Models.ResetPasswordModel> ResetPasswordModels { get; set; }

        //public System.Data.Entity.DbSet<Smart_Shop.Models.RegisterModel> RegisterModels { get; set; }
    }
}
