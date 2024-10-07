using System;
using System.Collections.Generic;

namespace ProgrammingTutor.Models;

public partial class Feedback
{
    public int FeedbackId { get; set; }

    public int? UserId { get; set; }

    public int? TutorialId { get; set; }

    public string? FeedbackText { get; set; }

    public int? Rating { get; set; }

    public DateTime? SubmittedDate { get; set; }

    public virtual Tutorial? Tutorial { get; set; }

    public virtual User? User { get; set; }
}
