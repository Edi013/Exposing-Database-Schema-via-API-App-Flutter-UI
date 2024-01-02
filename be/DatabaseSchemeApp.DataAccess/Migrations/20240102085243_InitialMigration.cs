using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DatabaseSchemeApp.DataAccess.Migrations
{
    public partial class InitialMigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Client",
                columns: table => new
                {
                    Id = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    Nume = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    Prenume = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    Companie = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    Adresa = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    Oras = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    Cod = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    Telefon = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Client", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Furnizor",
                columns: table => new
                {
                    Id = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    NumeFurnizor = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    TimpExecutie = table.Column<int>(type: "NUMBER(10)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Furnizor", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Comanda",
                columns: table => new
                {
                    Id = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    IdClient = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    ClientId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    DataComanda = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false),
                    DataOnorare = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false),
                    DataPlatii = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Comanda", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Comanda_Client_ClientId",
                        column: x => x.ClientId,
                        principalTable: "Client",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Stoc",
                columns: table => new
                {
                    Id = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    IdFurnizor = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    FurnizorId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    Descriere = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    PretUnitar = table.Column<float>(type: "BINARY_FLOAT", nullable: false),
                    Unitate = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    DescriereUnitate = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Stoc", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Stoc_Furnizor_FurnizorId",
                        column: x => x.FurnizorId,
                        principalTable: "Furnizor",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Articol",
                columns: table => new
                {
                    Id = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    IdComanda = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    ComandaId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    IdStoc = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    StocId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    Cantitate = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    PretTotal = table.Column<float>(type: "BINARY_FLOAT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Articol", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Articol_Comanda_ComandaId",
                        column: x => x.ComandaId,
                        principalTable: "Comanda",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Articol_Stoc_StocId",
                        column: x => x.StocId,
                        principalTable: "Stoc",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Articol_ComandaId",
                table: "Articol",
                column: "ComandaId");

            migrationBuilder.CreateIndex(
                name: "IX_Articol_StocId",
                table: "Articol",
                column: "StocId");

            migrationBuilder.CreateIndex(
                name: "IX_Comanda_ClientId",
                table: "Comanda",
                column: "ClientId");

            migrationBuilder.CreateIndex(
                name: "IX_Stoc_FurnizorId",
                table: "Stoc",
                column: "FurnizorId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Articol");

            migrationBuilder.DropTable(
                name: "Comanda");

            migrationBuilder.DropTable(
                name: "Stoc");

            migrationBuilder.DropTable(
                name: "Client");

            migrationBuilder.DropTable(
                name: "Furnizor");
        }
    }
}
