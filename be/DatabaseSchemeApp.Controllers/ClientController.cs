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
        public async Task<Client> CreateClient(CreateClientRequest req)
        {
            return await mediator.Send(req, CancellationToken.None);
        }

        [HttpDelete("Delete")]
        public async Task<bool> DeleteClient(DeleteClientRequest req)
        {
            return await mediator.Send(req, CancellationToken.None);
        }

        [HttpPut("Update")]
        public async Task<Client> UpdateClient(UpdateClientRequest req)
        {
            return await mediator.Send(req, CancellationToken.None);
        }
    }
}