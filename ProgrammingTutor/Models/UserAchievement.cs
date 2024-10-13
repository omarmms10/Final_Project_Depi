using System;
using Microsoft.AspNetCore.Identity;

namespace ProgrammingTutor.Models
{
    public partial class UserAchievement
    {
        public int UserAchievementId { get; set; }

        public string? UserId { get; set; } // Foreign key to IdentityUser

        public int? AchievementId { get; set; } // Foreign key to Achievement

        public DateTime? EarnedDate { get; set; }

        // Navigation properties
        public virtual Achievement? Achievement { get; set; }  // Link to Achievement entity

        public virtual IdentityUser? User { get; set; }  // Link to IdentityUser entity
    }
}
