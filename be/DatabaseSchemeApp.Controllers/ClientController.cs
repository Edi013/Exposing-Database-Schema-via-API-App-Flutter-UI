using DatabaseSchemeApp.Application.Requests.ClientRequests;
using DatabaseSchemeApp.Domain.Models;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace DatabaseSchemeApp.Controllers
{
    [ApiController]
    [Route("Api/[controller]")]
    public class ClientController : ControllerBase
    {
        private readonly IMediator mediator;

        public ClientController(IMediator mediator)
        {
            this.mediator = mediator;
        }

        [HttpGet("GetAll")]
        public async Task<IEnumerable<Client>> GetAll()
        {
            var req = new GetAllClientRequest();

            var result = await mediator.Send(req, CancellationToken.None);
            return result;
        }

        [HttpPost("Create")]
        public async Task<Client> Create(CreateClientRequest req)
        {
            return await mediator.Send(req, CancellationToken.None);
        }

        [HttpDelete("Delete/{id}")]
        public async Task<bool> Delete(decimal id)
        {
            var req = new DeleteClientRequest()
            { Id = id };

            return await mediator.Send(req, CancellationToken.None);
        }

        [HttpPut("Update")]
        public async Task<Client> Update(UpdateClientRequest req)
        {
            return await mediator.Send(req, CancellationToken.None);
        }
    }
}