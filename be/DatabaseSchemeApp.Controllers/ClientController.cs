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
            var req = new GetAllToDoRequest();

            logger.LogInformation("GetAll [GET] request for ToDos.");
            var result = await mediator.Send(req, CancellationToken.None);
            return result;
        }

        [HttpPost("Create")]
        public async Task<ToDo> CreateToDo(CreateToDoRequest req)
        {
            logger.LogInformation("Create [POST] request for a ToDo.");

            return await mediator.Send(req, CancellationToken.None);
        }

        [HttpDelete("Delete")]
        public async Task<BaseResult> DeleteToDo(DeleteToDoRequest req)
        {
            logger.LogInformation($"Delete [DELETE] request for ToDo with id {req.Id}.");

            return await mediator.Send(req, CancellationToken.None);
        }

        [HttpPut("Update")]
        public async Task<ToDo> UpdateToDo(UpdateToDoRequest req)
        {
            logger.LogInformation($"Update [PUT] request for ToDo with id {req.Id}.");

            return await mediator.Send(req, CancellationToken.None);
        }
    }
}