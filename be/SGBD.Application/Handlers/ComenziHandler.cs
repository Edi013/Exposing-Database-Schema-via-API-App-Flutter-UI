using Microsoft.Extensions.Configuration;
using SGBD.Domain.DTOs;
using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;
using System.Runtime.Serialization;

namespace SGBD.Application.Handlers
{
    public class ComenziHandler
    {
        IComenziRepository repository;

        public ComenziHandler(IComenziRepository repository)
        {
            this.repository = repository;
        }

        public async Task<Comenzi> Create(ComenziDto request)
        {
            DateTime deliveryDate, orderDate, payDate;
            tryParseStringToDateTime(request.DataOnorare, out deliveryDate);
            tryParseStringToDateTime(request.DataPlasare, out orderDate);
            tryParseStringToDateTime(request.DataPlata, out payDate);

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
            DateTime deliveryDate, orderDate, payDate;
            tryParseStringToDateTime(request.DataOnorare, out deliveryDate);
            tryParseStringToDateTime(request.DataPlasare, out orderDate);
            tryParseStringToDateTime(request.DataPlata, out payDate);

            var newOrder = new Comenzi
            {
                Id = (decimal)request.Id ,
                IdClienti = request.IdClienti,
                DataOnorare = deliveryDate,
                DataPlasare = orderDate,
                DataPlata = payDate,
            };

            var result = await repository.Update(newOrder);
            return result;
        }
   
        public async Task<IQueryable<ContextComandaDto>> ContextComanda()
        {
            var result = await repository.GetContextComanda();
            return result;
        }

        public async Task<ContextComenziDto> ContextComanzi()
        {
            var result = await repository.GetContextComenzi();
            return result;
        }

        public async Task<IEnumerable<ArticoleComandateNiciodataDto>> ArticoleComandateNiciodata()
        {
            var result = await repository.GetArticoleComandateNiciodata();
            return result;
        }

        private void tryParseStringToDateTime(in string input, out DateTime output)
        {
            if(input == null) {
                output = DateTime.MinValue;
                return;
            }

            if (!DateTime.TryParse(input, out output))
            {
                throw new InvalidCastException();
            }
        }
    }
}
