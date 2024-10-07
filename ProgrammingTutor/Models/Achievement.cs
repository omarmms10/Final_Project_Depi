using System;
using System.Collections.Generic;

namespace ProgrammingTutor.Models;

public partial class Achievement
{
    public int AchievementId { get; set; }

    public string Title { get; set; } = null!;

    public string? Description { get; set; }

    public DateTime? CreatedDate { get; set; }

    public virtual ICollection<UserAchievement> UserAchievements { get; set; } = new List<UserAchievement>();
}
