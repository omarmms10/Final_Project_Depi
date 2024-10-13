using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;
using ProgrammingTutor.Models;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

[Authorize]  // Ensure only logged-in users can submit feedback
public class FeedbackController : Controller
{
    private readonly KidProgrammingContext _context;
    private readonly UserManager<IdentityUser> _userManager;

    public FeedbackController(KidProgrammingContext context, UserManager<IdentityUser> userManager)
    {
        _context = context;
        _userManager = userManager;
    }

    // GET: /Feedback/FeedbackList
    public async Task<IActionResult> FeedbackList()
    {
        var user = await _userManager.GetUserAsync(User);
        if (user == null)
        {
            TempData["Error"] = "You must be logged in to submit feedback.";
            return RedirectToAction("Login", "Account");
        }

        var userId = user.Id;

        // Fetch the completed tutorials for the current user
        var completedTutorials = await _context.Progresses
            .Include(p => p.Tutorial)
            .Where(p => p.UserId == userId && p.Completed && p.Tutorial != null)  // Ensure tutorial is not null
            .Select(p => p.Tutorial)
            .ToListAsync();

        return View(completedTutorials);
    }

    // GET: /Feedback/Feedback/{id}
    public async Task<IActionResult> Feedback(int id)
    {
        var tutorial = await _context.Tutorials.FirstOrDefaultAsync(t => t.TutorialId == id);
        if (tutorial == null)
        {
            return NotFound();
        }

        var feedbacks = await _context.Feedbacks
            .Where(f => f.TutorialId == id)
            .Include(f => f.User)
            .ToListAsync();

        ViewBag.Tutorial = tutorial;
        ViewBag.ExistingFeedbacks = feedbacks;

        return View();
    }

    // POST: /Feedback/SubmitFeedback/{id}
    [HttpPost]
    // POST: /Feedback/SubmitFeedback/{id}
    [HttpPost]
    public async Task<IActionResult> SubmitFeedback(int id, string feedbackText, int? rating)
    {
        var user = await _userManager.GetUserAsync(User);

        if (user == null || string.IsNullOrEmpty(feedbackText) || !rating.HasValue)
        {
            ModelState.AddModelError(string.Empty, "Please provide valid feedback and a rating.");
            return RedirectToAction("Feedback", new { id = id });
        }

        // Create a new feedback entry
        var feedback = new Feedback
        {
            UserId = user.Id,
            TutorialId = id,
            FeedbackText = feedbackText,
            Rating = rating,
            SubmittedDate = DateTime.Now
        };

        _context.Feedbacks.Add(feedback);
        await _context.SaveChangesAsync();

        TempData["Success"] = "Thank you for your feedback!";
        return RedirectToAction("Feedback", new { id = id });
    }

}
