using Microsoft.Extensions.Configuration;
using SGBD.Domain.DTOs;
using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;
using System.Runtime.Serialization;

namespace SGBD.Application.Handlers
{
    public class ComenziHandler
    {
        IOrderRepository repository;
        private readonly IConfiguration _configuration;

        public ComenziHandler(IOrderRepository repository, IConfiguration _configuration)
        {
            this.repository = repository;
            this._configuration = _configuration;
        }

        public async Task<Comenzi> Create(ComenziDto request)
        {
            string[] dateTimeFormats = { _configuration.GetSection("DateTimeFormats:1").Value, _configuration.GetSection("DateTimeFormats:2").Value,
                _configuration.GetSection("DateTimeFormats:3").Value, _configuration.GetSection("DateTimeFormats:4").Value };

            DateTime deliveryDate, orderDate, payDate;
            tryParseStringToDateTime(request.DataOnorare, out deliveryDate, dateTimeFormats);
            tryParseStringToDateTime(request.DataPlasare, out orderDate, dateTimeFormats);
            tryParseStringToDateTime(request.DataPlata, out payDate, dateTimeFormats);

            var newOrder = new Comenzi
            {
                Id = 0,
                IdClienti = request.IdClienti,
                DataOnorare = deliveryDate,
                DataPlasare = orderDate,
                DataPlata = payDate,
            };

            var result = await repository.Add(newOrder);
            return result;
        }

        public async Task<bool> Delete(decimal id)
        {
            var result = await repository.DeleteById(id);
            return result;
        }

        public async Task<IEnumerable<Comenzi>> GetAll()
        {
            var result = await repository.GetAll();
            return result;
        }

        public async Task<Comenzi> Update(ComenziDto request)
        {
            string[] dateTimeFormats = { _configuration.GetSection("DateTimeFormats:1").Value, _configuration.GetSection("DateTimeFormats:2").Value,
                _configuration.GetSection("DateTimeFormats:3").Value, _configuration.GetSection("DateTimeFormats:4").Value };

            DateTime deliveryDate, orderDate, payDate;
            tryParseStringToDateTime(request.DataOnorare, out deliveryDate, dateTimeFormats);
            tryParseStringToDateTime(request.DataPlasare, out orderDate, dateTimeFormats);
            tryParseStringToDateTime(request.DataPlata, out payDate, dateTimeFormats);

            var newOrder = new Comenzi
            {
                Id = 0,
                IdClienti = request.IdClienti,
                DataOnorare = deliveryDate,
                DataPlasare = orderDate,
                DataPlata = payDate,
            };

            var result = await repository.Update(newOrder);
            return result;
        }
   
        public async Task<IQueryable<ContextComandaDto>> GetEachOrderStatistics()
        {
            var result = await repository.GetOrderStatiGetEachOrderStatistics();
            return result;
        }

        public async Task<ContextComenziDto> GetOverallOrderStatistics()
        {
            var result = await repository.GetOverallOrderStatistics();
            return result;
        }

        public async Task<IEnumerable<ArticoleComandateNiciodataDto>> GetNeverOrderedItems()
        {
            var result = await repository.GetNeverOrderedItems();
            return result;
        }

        private void tryParseStringToDateTime(in string input, out DateTime output, string[] dateTimeFormat)
        {
            if(input == null) {
                output = DateTime.MinValue;
                return;
            }

            if (!DateTime.TryParseExact(input, dateTimeFormat, null, System.Globalization.DateTimeStyles.None, out output))
            {
                throw new InvalidCastException();
            }
        }
    }
}
