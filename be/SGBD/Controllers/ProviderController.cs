﻿using Microsoft.AspNetCore.Mvc;
using SGBD.Application.Handlers;
using SGBD.Domain.Entities;

namespace SGBD.Controllers
{
    [ApiController]
    [Route("Api/[controller]")]
    public class ProviderController : ControllerBase
    {
        private readonly ProviderHandler handler;

        public ProviderController(ProviderHandler handler)
        {
            this.handler = handler;
        }

        [HttpGet("GetAll")]
        public async Task<IEnumerable<Furnizori>> GetAll()
        {
            var result = await handler.GetAll();
            return result;
        }

        [HttpPost("Create")]
        public async Task<Furnizori> Create(Furnizori req)
        {
            return await handler.Create(req);
        }

        [HttpDelete("Delete/{id}")]
        public async Task<bool> Delete(decimal id)
        {
            return await handler.Delete(id);
        }

        [HttpPut("Update")]
        public async Task<Furnizori> Update(Furnizori req)
        {
            return await handler.Update(req);
        }
    }
}