using Microsoft.AspNetCore.Identity;
using System.Collections.Generic;

namespace ProgrammingTutor.Models
{
    public partial class User : IdentityUser
    {
        public int? Age { get; set; }

        public DateTime? DateJoined { get; set; }

        public bool? IsActive { get; set; }

        public virtual ICollection<Feedback> Feedbacks { get; set; } = new List<Feedback>();

        public virtual ICollection<Progress> Progresses { get; set; } = new List<Progress>();

        public virtual ICollection<UserAchievement> UserAchievements { get; set; } = new List<UserAchievement>();

        public virtual ICollection<UserRole> UserRoles { get; set; } = new List<UserRole>();
    }
}
