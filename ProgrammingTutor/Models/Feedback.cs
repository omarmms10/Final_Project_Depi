using System;
using Microsoft.AspNetCore.Identity;

namespace ProgrammingTutor.Models
{
    public partial class Feedback
    {
        public int FeedbackId { get; set; }

        public string? UserId { get; set; } // Foreign key to IdentityUser

        public int? TutorialId { get; set; } // Foreign key to Tutorial

        public string? FeedbackText { get; set; }

        public int? Rating { get; set; }

        public DateTime? SubmittedDate { get; set; }

        // Navigation properties
        public virtual Tutorial? Tutorial { get; set; }  // Link to Tutorial entity

        public virtual IdentityUser? User { get; set; }  // Link to IdentityUser entity
    }
}
