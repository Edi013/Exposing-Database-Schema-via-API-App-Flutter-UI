using Microsoft.AspNetCore.Mvc;
using SGBD.Application.Handlers;
using SGBD.Domain.Models;

namespace SGBD.Controllers
{
    [ApiController]
    [Route("Api/[controller]")]
    public class ClientController : ControllerBase
    {
        private readonly ClientHandler handler;

        public ClientController(ClientHandler handler)
        {
            this.handler = handler;
        }

        [HttpGet("GetAll")]
        public async Task<IEnumerable<Client>> GetAll()
        {
            var result = await handler.GetAll();
            return result;
        }

        [HttpPost("Create")]
        public async Task<Client> Create(Client req)
        {
            return await handler.Create(req);
        }

        [HttpDelete("Delete/{id}")]
        public async Task<bool> Delete(decimal id)
        {
            return await handler.Delete(id);
        }

        [HttpPut("Update")]
        public async Task<Client> Update(Client req)
        {
            return await handler.Update(req);
        }
    }
}