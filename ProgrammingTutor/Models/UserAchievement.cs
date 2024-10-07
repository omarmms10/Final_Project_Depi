using System;
using System.Collections.Generic;

namespace ProgrammingTutor.Models;

public partial class UserAchievement
{
    public int UserAchievementId { get; set; }

    public int? UserId { get; set; }

    public int? AchievementId { get; set; }

    public DateTime? EarnedDate { get; set; }

    public virtual Achievement? Achievement { get; set; }

    public virtual User? User { get; set; }
}
