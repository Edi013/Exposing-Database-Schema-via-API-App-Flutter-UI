using Microsoft.EntityFrameworkCore;
using SGBD.Application.Handlers;
using SGBD.DataAccess;
using SGBD.DataAccess.Repositories;
using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;

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
            builder.Services.AddDbContext<ApplicationDbContext>(options => options.UseOracle(connectionString, p => {
                p.UseOracleSQLCompatibility("11");
            }));

            builder.Services.AddScoped<ClientiHandler, ClientiHandler>();
            builder.Services.AddScoped<ComenziHandler, ComenziHandler>();
            builder.Services.AddScoped<ArticoleHandler, ArticoleHandler>();
            builder.Services.AddScoped<StocHandler, StocHandler>();
            builder.Services.AddScoped<FurnizoriHandler, FurnizoriHandler>();

            builder.Services.AddScoped<IRepository<Clienti>, ClientRepository>();
            builder.Services.AddScoped<IOrderRepository, OrderRepository>();
            builder.Services.AddScoped<IRepository<Articole>, ItemRepository>();
            builder.Services.AddScoped<IRepository<Stoc>, StorageLocationRepository>();
            builder.Services.AddScoped<IRepository<Furnizori>, ProviderRepository>();

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
