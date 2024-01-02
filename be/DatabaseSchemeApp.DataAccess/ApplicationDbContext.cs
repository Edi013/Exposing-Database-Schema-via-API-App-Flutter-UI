using DatabaseSchemeApp.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace DatabaseSchemeApp.DataAccess
{
    public class ApplicationDbContext : DbContext
    {

        private IConfiguration configuration;

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options, IConfiguration _configuration)
            : base(options)
        {
            configuration = _configuration;
        }

        public virtual DbSet<Articol> Articole { get; set; } = null!;
        public virtual DbSet<Client> Clienti { get; set; } = null!;
        public virtual DbSet<Comanda> Comenzi { get; set; } = null!;
        public virtual DbSet<Furnizor> Furnizori { get; set; } = null!;
        public virtual DbSet<Stoc> Stoc { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            if (!options.IsConfigured)
            {
                options.UseOracle(configuration.GetConnectionString("DatabaseSchemeApp"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Articol>(entity =>
            {
                entity.ToTable("ARTICOLE");

                entity.Property(e => e.Id)
                    .HasColumnType("NUMBER")
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");

                entity.Property(e => e.Cantitate)
                    .HasColumnType("NUMBER")
                    .HasColumnName("CANTITATE");

                entity.Property(e => e.IdComanda)
                    .HasColumnType("NUMBER")
                    .HasColumnName("ID_COMENZI");

                entity.Property(e => e.IdStoc)
                    .HasColumnType("NUMBER")
                    .HasColumnName("ID_STOC");

                entity.Property(e => e.PretTotal)
                    .HasColumnType("NUMBER")
                    .HasColumnName("PRET_TOTAL");

                entity.HasOne(d => d.IdComandaNavigation)
                    .WithMany(p => p.Articole)
                    .HasForeignKey(d => d.IdComanda)
                    .HasConstraintName("SYS_C007698");

                entity.HasOne(d => d.IdStocNavigation)
                    .WithMany(p => p.Articole)
                    .HasForeignKey(d => d.IdStoc)
                    .HasConstraintName("SYS_C007699");
            });

            modelBuilder.Entity<Client>(entity =>
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

            modelBuilder.Entity<Comanda>(entity =>
            {
                entity.ToTable("COMENZI");

                entity.Property(e => e.Id)
                    .HasColumnType("NUMBER")
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");

                entity.Property(e => e.DataComenzi)
                    .HasColumnType("DATE")
                    .HasColumnName("DATA_COMENZI");

                entity.Property(e => e.DataOnorare)
                    .HasColumnType("DATE")
                    .HasColumnName("DATA_ONORARE");

                entity.Property(e => e.DataPlatii)
                    .HasColumnType("DATE")
                    .HasColumnName("DATA_PLATII");

                entity.Property(e => e.IdClienti)
                    .HasColumnType("NUMBER")
                    .HasColumnName("ID_CLIENTI");

                entity.HasOne(d => d.IdClientiNavigation)
                    .WithMany(p => p.Comenzi)
                    .HasForeignKey(d => d.IdClienti)
                    .HasConstraintName("SYS_C007696");
            });

            modelBuilder.Entity<Furnizor>(entity =>
            {
                entity.ToTable("FURNIZORI");

                entity.Property(e => e.Id)
                    .HasColumnType("NUMBER")
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");

                entity.Property(e => e.NumeFurnizori)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("NUME_FURNIZORI");

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
                    .HasColumnName("ID_FURNIZORI");

                entity.Property(e => e.PretUnitar)
                    .HasColumnType("NUMBER")
                    .HasColumnName("PRET_UNITAR");

                entity.Property(e => e.Unitate)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("UNITATE");

                entity.HasOne(d => d.IdFurnizoriNavigation)
                    .WithMany(p => p.Stocuri)
                    .HasForeignKey(d => d.IdFurnizori)
                    .HasConstraintName("SYS_C007693");
            });

            modelBuilder.HasSequence("SEQ_ARTICOLE");

            modelBuilder.HasSequence("SEQ_CLIENTI");

            modelBuilder.HasSequence("SEQ_COMENZI");

            modelBuilder.HasSequence("SEQ_FURNIZORI");

            modelBuilder.HasSequence("SEQ_STOC");

        }
    }
}
