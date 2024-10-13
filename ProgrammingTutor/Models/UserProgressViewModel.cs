using Microsoft.AspNetCore.Identity;
using System.Collections.Generic;

namespace ProgrammingTutor.Models
{
    public class UserProgressViewModel
    {
        public IdentityUser User { get; set; }
        public List<Progress> ProgressList { get; set; }
        public List<UserAchievement> Achievements { get; set; }
    }
}
