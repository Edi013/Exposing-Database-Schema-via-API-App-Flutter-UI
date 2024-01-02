using DatabaseSchemeApp.Domain.Models;
using MediatR;

namespace DatabaseSchemeApp.Application.Requests.ClientRequests
{
    public class GetAllClientRequest : IRequest<IEnumerable<Client>>
    {
    }
}
