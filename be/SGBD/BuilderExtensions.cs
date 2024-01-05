using Microsoft.EntityFrameworkCore;
using SGBD.Application.Handlers;
using SGBD.DataAccess;
using SGBD.DataAccess.Repositories;
using SGBD.Domain.Interfaces;
using SGBD.Domain.Models;

namespace SGBD
{
    public static class BuilderExtensions
    {
        public static void RegisterServices(this WebApplicationBuilder builder)
        {
            builder.Services.AddControllers();
            builder.Services.AddEndpointsApiExplorer();

            builder.ConfigureCors();

            builder.RegisterSwaggerSettings();

            var connectionString = builder.Configuration.GetConnectionString("SGBD");
            builder.Services.AddDbContext<AppDbContext>(options => options.UseOracle(connectionString, p => {
                p.UseOracleSQLCompatibility("11");
            }));

            builder.Services.AddScoped<ClientHandler, ClientHandler>();
            builder.Services.AddScoped<OrderHandler, OrderHandler>();
            builder.Services.AddScoped<ItemHandler, ItemHandler>();
            builder.Services.AddScoped<StorageLocationHandler, StorageLocationHandler>();
            builder.Services.AddScoped<ProviderHandler, ProviderHandler>();

            builder.Services.AddScoped<IRepository<Client>, ClientRepository>();
            builder.Services.AddScoped<IOrderRepository, OrderRepository>();
            builder.Services.AddScoped<IRepository<Item>, ItemRepository>();
            builder.Services.AddScoped<IRepository<StorageLocation>, StorageLocationRepository>();
            builder.Services.AddScoped<IRepository<Provider>, ProviderRepository>();

            builder.RegisterAppSettings();
        }
        
        private static void ConfigureCors(this WebApplicationBuilder builder)
        {
            var frontendAppUrl = builder.Configuration.GetSection("FrontendApp:Url");

            builder.Services.AddCors(options =>
            {
                options.AddPolicy(name: "CorsPolicy",
                                          policy =>
                                          {
                                              policy
                                              //.AllowAnyOrigin()
                                              .WithOrigins(frontendAppUrl.Value)
                                              .AllowAnyHeader()
                                              .AllowAnyMethod();
                                          });
            });
        }

        private static void RegisterSwaggerSettings(this WebApplicationBuilder builder)
        {
            builder.Services.AddSwaggerGen();
        }
        
        private static void RegisterAppSettings(this WebApplicationBuilder builder)
        {
            var configuration = new ConfigurationBuilder()
            .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
            .Build();
            builder.Services.AddSingleton(configuration);
        }
    }
}
