using Microsoft.AspNetCore.Mvc;
using SGBD.Application.Handlers;
using SGBD.Domain.DTOs;
using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;

namespace SGBD.Controllers
{
    [ApiController]
    [Route("Api/[controller]")]
    public class ComenziController : ControllerBase
    {
        private readonly ComenziHandler handler;

        public ComenziController(ComenziHandler handler)
        {
            this.handler = handler;
        }

        [HttpGet("GetAll")]
        public async Task<IEnumerable<Comenzi>> GetAll()
        {
            var result = await handler.GetAll();
            return result;
        }
        [HttpGet("ContextComanda")]
        public async Task<IQueryable<ContextComandaDto>> ContextComanda()
        {
            var result = await handler.ContextComanda();
            return result;
        }

        [HttpGet("ContextComanzi")]
        public async Task<ContextComenziDto> ContextComanzi()
        {
            var result = await handler.ContextComanzi();
            return result;
        }

        [HttpGet("ArticoleComandateNiciodata")]
        public async Task<IEnumerable<ArticoleComandateNiciodataDto>> ArticoleComandateNiciodata()
        {
            var result = await handler.ArticoleComandateNiciodata();
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