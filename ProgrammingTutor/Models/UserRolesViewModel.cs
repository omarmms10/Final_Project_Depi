using Microsoft.AspNetCore.Identity;
using System.Collections.Generic;

namespace ProgrammingTutor.Models
{
    public class UserRolesViewModel
    {
        public IdentityUser User { get; set; }
        public List<string> Roles { get; set; }
    }
}
