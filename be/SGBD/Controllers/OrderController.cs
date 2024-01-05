using Microsoft.AspNetCore.Mvc;
using SGBD.Application.Handlers;
using SGBD.Domain.DTOs;
using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;

namespace SGBD.Controllers
{
    [ApiController]
    [Route("Api/[controller]")]
    public class OrderController : ControllerBase
    {
        private readonly ComenziHandler handler;

        public OrderController(ComenziHandler handler)
        {
            this.handler = handler;
        }

        [HttpGet("GetAll")]
        public async Task<IEnumerable<Comenzi>> GetAll()
        {
            var result = await handler.GetAll();
            return result;
        }
        [HttpGet("GetEachOrderStatistics")]
        public async Task<IQueryable<ContextComandaDto>> GetEachOrderStatistics()
        {
            var result = await handler.GetEachOrderStatistics();
            return result;
        }

        [HttpGet("GetOverallOrderStatistics")]
        public async Task<ContextComenziDto> GetOverallOrderStatistics()
        {
            var result = await handler.GetOverallOrderStatistics();
            return result;
        }

        [HttpGet("GetNeverOrderedItems")]
        public async Task<IEnumerable<ArticoleComandateNiciodataDto>> GetNeverOrderedItems()
        {
            var result = await handler.GetNeverOrderedItems();
            return result;
        }

        [HttpPost("Create")]
        public async Task<Comenzi> Create(ComenziDto req)
        {
            var result = await handler.Create(req);
            return result;
        }

        [HttpDelete("Delete/{id}")]
        public async Task<bool> Delete(decimal id)
        {
            return await handler.Delete(id);
        }

        [HttpPut("Update")]
        public async Task<Comenzi> Update(ComenziDto req)
        {
            return await handler.Update(req);
        }
    }
}