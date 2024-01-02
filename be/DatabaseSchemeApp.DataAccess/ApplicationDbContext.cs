using DatabaseSchemeApp.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace DatabaseSchemeApp.DataAccess
{
    public class ApplicationDbContext : DbContext
    {
        private IConfiguration Configuration;
        public DbSet<Client> Client { get; set; }

        public ApplicationDbContext(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            base.OnConfiguring(options);

            options.UseOracle(Configuration.GetConnectionString("DatabaseSchemeApp"));
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            ConfigureTableNames(modelBuilder);

            base.OnModelCreating(modelBuilder);
        }

        private void ConfigureTableNames(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Client>().ToTable("Client");
            modelBuilder.Entity<Comanda>().ToTable("Comanda");
            modelBuilder.Entity<Articol>().ToTable("Articol");
            modelBuilder.Entity<Stoc>().ToTable("Stoc");
            modelBuilder.Entity<Furnizor>().ToTable("Furnizor");
        }
    }
}