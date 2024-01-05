using Microsoft.AspNetCore.Mvc;
using SGBD.Application.Handlers;
using SGBD.Domain.DTOs;
using SGBD.Domain.Interfaces;
using SGBD.Domain.Models;

namespace SGBD.Controllers
{
    [ApiController]
    [Route("Api/[controller]")]
    public class OrderController : ControllerBase
    {
        private readonly OrderHandler handler;

        public OrderController(OrderHandler handler)
        {
            this.handler = handler;
        }

        [HttpGet("GetAll")]
        public async Task<IEnumerable<Order>> GetAll()
        {
            var result = await handler.GetAll();
            return result;
        }
        [HttpGet("GetEachOrderStatistics")]
        public async Task<IQueryable<EachOrderDto>> GetEachOrderStatistics()
        {
            var result = await handler.GetEachOrderStatistics();
            return result;
        }

        [HttpGet("GetOverallOrderStatistics")]
        public async Task<OverallOrderStatisticsDto> GetOverallOrderStatistics()
        {
            var result = await handler.GetOverallOrderStatistics();
            return result;
        }

        [HttpGet("GetNeverOrderedItems")]
        public async Task<IEnumerable<NeverOrderedItemDto>> GetNeverOrderedItems()
        {
            var result = await handler.GetNeverOrderedItems();
            return result;
        }

        [HttpPost("Create")]
        public async Task<Order> Create(OrderDto req)
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
        public async Task<Order> Update(OrderDto req)
        {
            return await handler.Update(req);
        }
    }
}