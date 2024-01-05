using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace SGBD.Domain.Entities
{
    public partial class ApplicationDbContext : DbContext
    {
        private IConfiguration _configuration;

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options, IConfiguration _configuration)
            : base(options)
        {
            this._configuration = _configuration;
        }

        public virtual DbSet<Clienti> TabelaClienti { get; set; } = null!;
        public virtual DbSet<Comenzi> TabelaComenzi { get; set; } = null!;
        public virtual DbSet<Articole> TabelaArticole { get; set; } = null!;
        public virtual DbSet<Stoc> TabelaStocuri { get; set; } = null!;
        public virtual DbSet<Furnizori> TabelaFurnizori { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseOracle(_configuration.GetConnectionString("SGBD"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Comenzi>(entity =>
            {
                entity.ToTable("COMENZI");

                entity.Property(e => e.Id)
                    .HasColumnType("NUMBER")
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");

                entity.Property(e => e.DataPlasare)
                    .HasColumnType("DATE")
                    .HasColumnName("DATA_COMENZI");

                entity.Property(e => e.DataOnorare)
                    .HasColumnType("DATE")
                    .HasColumnName("DATA_ONORARE");

                entity.Property(e => e.DataPlata)
                    .HasColumnType("DATE")
                    .HasColumnName("DATA_PLATII");

                entity.Property(e => e.IdClienti)
                    .HasColumnType("NUMBER")
                    .HasColumnName("ID_CLIENTI");
            });

            modelBuilder.Entity<Articole>(entity =>
            {
                entity.ToTable("ARTICOLE");

                entity.Property(e => e.Id)
                    .HasColumnType("NUMBER")
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");

                entity.Property(e => e.Cantitate)
                    .HasColumnType("NUMBER")
                    .HasColumnName("CANTITATE");

                entity.Property(e => e.IdComenzi)
                    .HasColumnType("NUMBER")
                    .HasColumnName("ID_COMENZI");

                entity.Property(e => e.IdStoc)
                    .HasColumnType("NUMBER")
                    .HasColumnName("ID_STOC");

                entity.Property(e => e.PretTotal)
                    .HasColumnType("NUMBER")
                    .HasColumnName("PRET_TOTAL");
            });

            modelBuilder.Entity<Clienti>(entity =>
            {
                entity.ToTable("CLIENTI");

                entity.Property(e => e.Id)
                    .HasColumnType("NUMBER")
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");

                entity.Property(e => e.Adresa)
                    .HasMaxLength(200)
                    .IsUnicode(false)
                    .HasColumnName("ADRESA");

                entity.Property(e => e.Cod)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("COD");

                entity.Property(e => e.Companie)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("COMPANIE");

                entity.Property(e => e.Nume)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("NUME");

                entity.Property(e => e.Oras)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("ORAS");

                entity.Property(e => e.Prenume)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("PRENUME");

                entity.Property(e => e.Telefon)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("TELEFON");
            });

            modelBuilder.Entity<Furnizori>(entity =>
            {
                entity.ToTable("FURNIZORI");

                entity.Property(e => e.Id)
                    .HasColumnType("NUMBER")
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");

                entity.Property(e => e.NumeFurnizori)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("NUME_FURNIZOR");

                entity.Property(e => e.TimpExecutie)
                    .HasColumnType("NUMBER")
                    .HasColumnName("TIMP_EXECUTIE");
            });

            modelBuilder.Entity<Stoc>(entity =>
            {
                entity.ToTable("STOC");

                entity.Property(e => e.Id)
                    .HasColumnType("NUMBER")
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");

                entity.Property(e => e.Descriere)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("DESCRIERE");

                entity.Property(e => e.DescriereUnitate)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("DESCRIERE_UNITATE");

                entity.Property(e => e.IdFurnizori)
                    .HasColumnType("NUMBER")
                    .HasColumnName("ID_FURNIZOR");

                entity.Property(e => e.PretUnitar)
                    .HasColumnType("NUMBER")
                    .HasColumnName("PRET_UNITAR");

                entity.Property(e => e.Unitate)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("UNITATE");
            });

            modelBuilder.HasSequence("SEQ_ARTICOLE");

            modelBuilder.HasSequence("SEQ_CLIENTI");

            modelBuilder.HasSequence("SEQ_COMENZI");

            modelBuilder.HasSequence("SEQ_FURNIZORI");

            modelBuilder.HasSequence("SEQ_STOC");
        }
    }
}
