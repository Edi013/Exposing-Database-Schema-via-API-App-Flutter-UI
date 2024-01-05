using Microsoft.EntityFrameworkCore;
using SGBD.Domain.Models;

namespace SGBD.DataAccess
{
    public partial class AppDbContext : DbContext
    {
        public AppDbContext()
        {
        }

        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Client> Clients { get; set; } = null!;
        public virtual DbSet<Order> Orders { get; set; } = null!;
        public virtual DbSet<Item> Items { get; set; } = null!;
        public virtual DbSet<StorageLocation> StorageLocations { get; set; } = null!;
        public virtual DbSet<Provider> Providers { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseOracle("User Id=system;Password=231;Data Source=//localhost:1521/xe");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Client>(entity =>
            {
                entity.ToTable("CLIENTS");

                entity.Property(e => e.Id)
                    .HasColumnType("NUMBER")
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");

                entity.Property(e => e.Adress)
                    .HasMaxLength(200)
                    .IsUnicode(false)
                    .HasColumnName("ADRESS");

                entity.Property(e => e.City)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("CITY");

                entity.Property(e => e.Company)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("COMPANY");

                entity.Property(e => e.FirstName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("FIRST_NAME");

                entity.Property(e => e.LastName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("LAST_NAME");

                entity.Property(e => e.PhoneNumber)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("PHONE_NUMBER");

                entity.Property(e => e.PostalCode)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("POSTAL_CODE");
            });

            modelBuilder.Entity<Item>(entity =>
            {
                entity.ToTable("ITEMS");

                entity.Property(e => e.Id)
                    .HasColumnType("NUMBER")
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");

                entity.Property(e => e.OrderId)
                    .HasColumnType("NUMBER")
                    .HasColumnName("ORDER_ID");

                entity.Property(e => e.Quantity)
                    .HasColumnType("NUMBER")
                    .HasColumnName("QUANTITY");

                entity.Property(e => e.StorageLocationId)
                    .HasColumnType("NUMBER")
                    .HasColumnName("STORAGE_LOCATION_ID");

                entity.Property(e => e.TotalPrice)
                    .HasColumnType("NUMBER")
                    .HasColumnName("TOTAL_PRICE");

                /*entity.HasOne(d => d.Order)
                    .WithOne(p => p.Items)
                    .HasForeignKey(d => d.OrderId)
                    .HasConstraintName("SYS_C007734");*/

                /*entity.HasOne(d => d.StorageLocation)
                    .WithMany(p => p.Items)
                    .HasForeignKey(d => d.StorageLocationId)
                    .HasConstraintName("SYS_C007735");*/
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.ToTable("ORDERS");

                entity.Property(e => e.Id)
                    .HasColumnType("NUMBER")
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");

                entity.Property(e => e.ClientId)
                    .HasColumnType("NUMBER")
                    .HasColumnName("CLIENT_ID");

                entity.Property(e => e.DeliveryDate)
                    .HasColumnType("DATE")
                    .HasColumnName("DELIVERY_DATE");

                entity.Property(e => e.OrderDate)
                    .HasColumnType("DATE")
                    .HasColumnName("ORDER_DATE");

                entity.Property(e => e.PayDate)
                    .HasColumnType("DATE")
                    .HasColumnName("PAY_DATE");

                /*entity.HasOne(d => d.Client)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.ClientId)
                    .HasConstraintName("SYS_C007726");*/
            });

            modelBuilder.Entity<Provider>(entity =>
            {
                entity.ToTable("PROVIDERS");

                entity.Property(e => e.Id)
                    .HasColumnType("NUMBER")
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");

                entity.Property(e => e.ExecutionDuration)
                    .HasColumnType("NUMBER")
                    .HasColumnName("EXECUTION_DURATION");

                entity.Property(e => e.ProviderName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("PROVIDER_NAME");
            });

            modelBuilder.Entity<StorageLocation>(entity =>
            {
                entity.ToTable("STORAGELOCATIONS");

                entity.Property(e => e.Id)
                    .HasColumnType("NUMBER")
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");

                entity.Property(e => e.LocationDescription)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("LOCATION_DESCRIPTION");

                entity.Property(e => e.LocationName)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("LOCATION_NAME");

                entity.Property(e => e.ProviderId)
                    .HasColumnType("NUMBER")
                    .HasColumnName("PROVIDER_ID");

                entity.Property(e => e.UnitPrice)
                    .HasColumnType("NUMBER")
                    .HasColumnName("UNIT_PRICE");

                /*entity.HasOne(d => d.Provider)
                    .WithMany(p => p.StorageLocations)
                    .HasForeignKey(d => d.ProviderId)
                    .HasConstraintName("SYS_C007732");*/
            });

            modelBuilder.HasSequence("SEQ_PK_CLIENTS");

            modelBuilder.HasSequence("SEQ_PK_ITEMS");

            modelBuilder.HasSequence("SEQ_PK_ORDERS");

            modelBuilder.HasSequence("SEQ_PK_PROVIDERS");

            modelBuilder.HasSequence("SEQ_PK_STORAGELOCATIONS");
        }
    }
}
