using System;
using System.Collections.Generic;

namespace ProgrammingTutor.Models;

public partial class Progress
{
    public int ProgressId { get; set; }

    public int? UserId { get; set; }

    public int? TutorialId { get; set; }

    public int? CurrentStep { get; set; }

    public bool? Completed { get; set; }

    public DateTime? StartedDate { get; set; }

    public DateTime? CompletedDate { get; set; }

    public virtual Tutorial? Tutorial { get; set; }

    public virtual User? User { get; set; }
}
