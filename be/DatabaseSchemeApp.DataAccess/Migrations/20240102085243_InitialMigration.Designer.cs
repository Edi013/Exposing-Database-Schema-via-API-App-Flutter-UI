﻿// <auto-generated />
using System;
using DatabaseSchemeApp.DataAccess;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Oracle.EntityFrameworkCore.Metadata;

#nullable disable

namespace DatabaseSchemeApp.DataAccess.Migrations
{
    [DbContext(typeof(ApplicationDbContext))]
    [Migration("20240102085243_InitialMigration")]
    partial class InitialMigration
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.20")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            OracleModelBuilderExtensions.UseIdentityColumns(modelBuilder, 1L, 1);

            modelBuilder.Entity("DatabaseSchemeApp.Domain.Entities.Articol", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("NUMBER(10)");

                    OraclePropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<int>("Cantitate")
                        .HasColumnType("NUMBER(10)");

                    b.Property<int>("ComandaId")
                        .HasColumnType("NUMBER(10)");

                    b.Property<int>("IdComanda")
                        .HasColumnType("NUMBER(10)");

                    b.Property<int>("IdStoc")
                        .HasColumnType("NUMBER(10)");

                    b.Property<float>("PretTotal")
                        .HasColumnType("BINARY_FLOAT");

                    b.Property<int>("StocId")
                        .HasColumnType("NUMBER(10)");

                    b.HasKey("Id");

                    b.HasIndex("ComandaId");

                    b.HasIndex("StocId");

                    b.ToTable("Articol", (string)null);
                });

            modelBuilder.Entity("DatabaseSchemeApp.Domain.Entities.Client", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("NUMBER(10)");

                    OraclePropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("Adresa")
                        .IsRequired()
                        .HasColumnType("NVARCHAR2(2000)");

                    b.Property<string>("Cod")
                        .IsRequired()
                        .HasColumnType("NVARCHAR2(2000)");

                    b.Property<string>("Companie")
                        .IsRequired()
                        .HasColumnType("NVARCHAR2(2000)");

                    b.Property<string>("Nume")
                        .IsRequired()
                        .HasColumnType("NVARCHAR2(2000)");

                    b.Property<string>("Oras")
                        .IsRequired()
                        .HasColumnType("NVARCHAR2(2000)");

                    b.Property<string>("Prenume")
                        .IsRequired()
                        .HasColumnType("NVARCHAR2(2000)");

                    b.Property<string>("Telefon")
                        .IsRequired()
                        .HasColumnType("NVARCHAR2(2000)");

                    b.HasKey("Id");

                    b.ToTable("Client", (string)null);
                });

            modelBuilder.Entity("DatabaseSchemeApp.Domain.Entities.Comanda", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("NUMBER(10)");

                    OraclePropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<int>("ClientId")
                        .HasColumnType("NUMBER(10)");

                    b.Property<DateTime>("DataComanda")
                        .HasColumnType("TIMESTAMP(7)");

                    b.Property<DateTime>("DataOnorare")
                        .HasColumnType("TIMESTAMP(7)");

                    b.Property<DateTime>("DataPlatii")
                        .HasColumnType("TIMESTAMP(7)");

                    b.Property<int>("IdClient")
                        .HasColumnType("NUMBER(10)");

                    b.HasKey("Id");

                    b.HasIndex("ClientId");

                    b.ToTable("Comanda", (string)null);
                });

            modelBuilder.Entity("DatabaseSchemeApp.Domain.Entities.Furnizor", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("NUMBER(10)");

                    OraclePropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("NumeFurnizor")
                        .IsRequired()
                        .HasColumnType("NVARCHAR2(2000)");

                    b.Property<int>("TimpExecutie")
                        .HasColumnType("NUMBER(10)");

                    b.HasKey("Id");

                    b.ToTable("Furnizor", (string)null);
                });

            modelBuilder.Entity("DatabaseSchemeApp.Domain.Entities.Stoc", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("NUMBER(10)");

                    OraclePropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("Descriere")
                        .IsRequired()
                        .HasColumnType("NVARCHAR2(2000)");

                    b.Property<string>("DescriereUnitate")
                        .IsRequired()
                        .HasColumnType("NVARCHAR2(2000)");

                    b.Property<int>("FurnizorId")
                        .HasColumnType("NUMBER(10)");

                    b.Property<int>("IdFurnizor")
                        .HasColumnType("NUMBER(10)");

                    b.Property<float>("PretUnitar")
                        .HasColumnType("BINARY_FLOAT");

                    b.Property<string>("Unitate")
                        .IsRequired()
                        .HasColumnType("NVARCHAR2(2000)");

                    b.HasKey("Id");

                    b.HasIndex("FurnizorId");

                    b.ToTable("Stoc", (string)null);
                });

            modelBuilder.Entity("DatabaseSchemeApp.Domain.Entities.Articol", b =>
                {
                    b.HasOne("DatabaseSchemeApp.Domain.Entities.Comanda", "Comanda")
                        .WithMany()
                        .HasForeignKey("ComandaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("DatabaseSchemeApp.Domain.Entities.Stoc", "Stoc")
                        .WithMany()
                        .HasForeignKey("StocId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Comanda");

                    b.Navigation("Stoc");
                });

            modelBuilder.Entity("DatabaseSchemeApp.Domain.Entities.Comanda", b =>
                {
                    b.HasOne("DatabaseSchemeApp.Domain.Entities.Client", "Client")
                        .WithMany()
                        .HasForeignKey("ClientId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Client");
                });

            modelBuilder.Entity("DatabaseSchemeApp.Domain.Entities.Stoc", b =>
                {
                    b.HasOne("DatabaseSchemeApp.Domain.Entities.Furnizor", "Furnizor")
                        .WithMany()
                        .HasForeignKey("FurnizorId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Furnizor");
                });
#pragma warning restore 612, 618
        }
    }
}
