using System;
using System.Collections.Generic;

namespace ProgrammingTutor.Models;

public partial class User
{
    public int UserId { get; set; }

    public string Username { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string PasswordHash { get; set; } = null!;

    public int? Age { get; set; }

    public DateTime? DateJoined { get; set; }

    public bool? IsActive { get; set; }

    public virtual ICollection<Feedback> Feedbacks { get; set; } = new List<Feedback>();

    public virtual ICollection<Progress> Progresses { get; set; } = new List<Progress>();

    public virtual ICollection<UserAchievement> UserAchievements { get; set; } = new List<UserAchievement>();

    public virtual ICollection<UserRole> UserRoles { get; set; } = new List<UserRole>();
}
