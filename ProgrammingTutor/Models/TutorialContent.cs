using System;
using System.Collections.Generic;

namespace ProgrammingTutor.Models;

public partial class TutorialContent
{
    public int ContentId { get; set; }

    public int? TutorialId { get; set; }

    public string? ContentText { get; set; }

    public string? MediaUrl { get; set; }

    public virtual Tutorial? Tutorial { get; set; }
}
