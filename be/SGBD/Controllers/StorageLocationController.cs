using Microsoft.AspNetCore.Mvc;
using SGBD.Application.Handlers;
using SGBD.Domain.DTOs;
using SGBD.Domain.Entities;

namespace SGBD.Controllers
{
    [ApiController]
    [Route("Api/[controller]")]
    public class StorageLocationController : ControllerBase
    {
        private readonly StorageLocationHandler handler;

        public StorageLocationController(StorageLocationHandler handler)
        {
            this.handler = handler;
        }

        [HttpGet("GetAll")]
        public async Task<IEnumerable<StorageLocationDto>> GetAll()
        {
            var result = await handler.GetAll();
            return result;
        }

        [HttpPost("Create")]
        public async Task<Stoc> Create(StorageLocationDto req)
        {
            return await handler.Create(req);
        }

        [HttpDelete("Delete/{id}")]
        public async Task<bool> Delete(decimal id)
        {
            return await handler.Delete(id);
        }

        [HttpPut("Update")]
        public async Task<Stoc> Update(StorageLocationDto req)
        {
            return await handler.Update(req);
        }
    }
}