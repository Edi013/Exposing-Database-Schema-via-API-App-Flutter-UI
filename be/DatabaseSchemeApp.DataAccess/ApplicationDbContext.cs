using DatabaseSchemeApp.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace DatabaseSchemeApp.DataAccess
{
    public class ApplicationDbContext : DbContext
    {
        private IConfiguration Configuration;
        public DbSet<Client> Clients { get; set; }

        public ApplicationDbContext(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            base.OnConfiguring(options);

            //useless?
            options.UseOracle(Configuration.GetConnectionString("DatabaseSchemeApp"));
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            ConfigureClient(modelBuilder);

            base.OnModelCreating(modelBuilder);
        }

        private void ConfigureClient(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Client>().HasKey(x => x.Id);
        }
    }
}