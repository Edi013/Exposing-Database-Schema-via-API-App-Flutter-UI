using MediatR;
using DatabaseSchemeApp.Domain.Entities;

namespace DatabaseSchemeApp.Application.Requests.ClientRequests
{
    public class GetAllClientRequest : IRequest<IEnumerable<Client>>
    {
    }
}
