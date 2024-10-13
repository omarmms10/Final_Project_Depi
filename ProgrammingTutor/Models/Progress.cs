using Microsoft.AspNetCore.Identity;
using System;

namespace ProgrammingTutor.Models
{
    public partial class Progress
    {
        public int ProgressId { get; set; }

        public string? UserId { get; set; }

        public int? TutorialId { get; set; }

        public bool Completed { get; set; }

        public DateTime? CompletedDate { get; set; }

        public DateTime? StartedDate { get; set; }

        // Add the missing CurrentStep property
        public int CurrentStep { get; set; }

        // Navigation properties
        public virtual Tutorial? Tutorial { get; set; }

        public virtual IdentityUser? User { get; set; }
    }
}
