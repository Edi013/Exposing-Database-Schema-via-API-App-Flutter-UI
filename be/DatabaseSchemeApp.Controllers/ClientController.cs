using DatabaseSchemeApp.Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

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

            logger.LogInformation("GetAll [GET] request for Clients.");
            var result = await mediator.Send(req, CancellationToken.None);
            return result;
        }

        [HttpPost("Create")]
        public async Task<Client> CreateClient(CreateClientRequest req)
        {
            logger.LogInformation("Create [POST] request for a Client.");

            return await mediator.Send(req, CancellationToken.None);
        }

        [HttpDelete("Delete")]
        public async Task<BaseResult> DeleteClient(DeleteClientRequest req)
        {
            logger.LogInformation($"Delete [DELETE] request for Client with id {req.Id}.");

            return await mediator.Send(req, CancellationToken.None);
        }

        [HttpPut("Update")]
        public async Task<Client> UpdateClient(UpdateClientRequest req)
        {
            logger.LogInformation($"Update [PUT] request for Client with id {req.Id}.");

            return await mediator.Send(req, CancellationToken.None);
        }
    }
}