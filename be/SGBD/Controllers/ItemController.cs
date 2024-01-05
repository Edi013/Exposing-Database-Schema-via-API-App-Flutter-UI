using Microsoft.AspNetCore.Mvc;
using SGBD.Application.Handlers;
using SGBD.Domain.DTOs;
using SGBD.Domain.Models;

namespace SGBD.Controllers
{
    [ApiController]
    [Route("Api/[controller]")]
    public class ItemController : ControllerBase
    {
        private readonly ItemHandler handler;

        public ItemController(ItemHandler handler)
        {
            this.handler = handler;
        }

        [HttpGet("GetAll")]
        public async Task<IEnumerable<ItemDto>> GetAll()
        {
            var result = await handler.GetAll();
            return result;
        }

        [HttpPost("Create")]
        public async Task<Item> Create(ItemDto req)
        {
            return await handler.Create(req);
        }

        [HttpDelete("Delete/{id}")]
        public async Task<bool> Delete(decimal id)
        {
            return await handler.Delete(id);
        }

        [HttpPut("Update")]
        public async Task<Item> Update(ItemDto req)
        {
            return await handler.Update(req);
        }
    }
}