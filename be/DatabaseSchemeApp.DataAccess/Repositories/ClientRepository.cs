﻿using DatabaseSchemeApp.Domain.Entities;
using DatabaseSchemeApp.Domain.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DatabaseSchemeApp.DataAccess.Repositories
{
    public class ClientRepository : RepositoryBase<Client>, IClientRepository
    {
        public ClientRepository(ApplicationDbContext context)
            : base(context)
        { }
    }
}
