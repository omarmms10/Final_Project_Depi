using System;
using System.Collections.Generic;

namespace ProgrammingTutor.Models;

public partial class Tutorial
{
    public int TutorialId { get; set; }

    public string Title { get; set; } = null!;

    public string? Description { get; set; }

    public string? Level { get; set; }

    public int? Duration { get; set; }

    public DateTime? CreatedDate { get; set; }

    public bool? IsActive { get; set; }

    public virtual ICollection<Feedback> Feedbacks { get; set; } = new List<Feedback>();

    public virtual ICollection<Progress> Progresses { get; set; } = new List<Progress>();

    public virtual ICollection<TutorialContent> TutorialContents { get; set; } = new List<TutorialContent>();
}
