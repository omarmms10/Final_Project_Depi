using Microsoft.AspNetCore.Identity;
using System.Collections.Generic;

namespace ProgrammingTutor.Models
{
    public class ManageUserViewModel
    {
        public IdentityUser User { get; set; }
        public List<string> UserRoles { get; set; }
        public List<IdentityRole> AllRoles { get; set; }
    }
}
