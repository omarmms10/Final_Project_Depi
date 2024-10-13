using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;
using ProgrammingTutor.Models;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;  // Needed for the [Authorize] attribute

[Authorize]  // Restricts access to logged-in users
public class ProgressController : Controller
{
    private readonly KidProgrammingContext _context;
    private readonly UserManager<IdentityUser> _userManager;

    public ProgressController(KidProgrammingContext context, UserManager<IdentityUser> userManager)
    {
        _context = context;
        _userManager = userManager;
    }

    // View progress for the current user
    public async Task<IActionResult> Index()
    {
        var user = await _userManager.GetUserAsync(User);

        if (user == null)
        {
            TempData["Error"] = "You must be logged in to view your progress.";
            return RedirectToAction("Login", "Account");  // Redirect to the login page
        }

        var userId = user.Id;

        // Get progress data for the current user
        var progressList = await _context.Progresses
                                         .Include(p => p.Tutorial)
                                         .Where(p => p.UserId == userId)
                                         .ToListAsync();

        // Get the user's achievements and pass it via ViewBag
        var achievements = await _context.UserAchievements
                                         .Include(ua => ua.Achievement)
                                         .Where(ua => ua.UserId == userId)
                                         .OrderByDescending(ua => ua.EarnedDate)
                                         .ToListAsync();
        ViewBag.Achievements = achievements;

        return View(progressList);
    }

    // Update user progress in a specific tutorial
    public async Task<IActionResult> UpdateProgress(int tutorialId, bool completed)
    {
        var user = await _userManager.GetUserAsync(User);

        if (user == null)
        {
            TempData["Error"] = "You must be logged in to update your progress.";
            return RedirectToAction("Login", "Account");
        }

        var userId = user.Id;

        var progress = await _context.Progresses.FirstOrDefaultAsync(p => p.UserId == userId && p.TutorialId == tutorialId);

        if (progress == null)
        {
            // Create new progress record if it doesn't exist
            progress = new Progress
            {
                UserId = userId,
                TutorialId = tutorialId,
                Completed = completed,
                StartedDate = DateTime.Now
            };

            _context.Progresses.Add(progress);
        }
        else
        {
            // Update existing progress
            progress.Completed = completed;
            if (completed)
            {
                progress.CompletedDate = DateTime.Now;
            }

            _context.Progresses.Update(progress);
        }

        await _context.SaveChangesAsync();

        // Check if the user has completed two tutorials
        var completedTutorials = await _context.Progresses
                                               .Where(p => p.UserId == userId && p.Completed)
                                               .CountAsync();

        if (completedTutorials % 2 == 0)
        {
            // Grant an achievement based on the number of tutorials completed
            var achievement = await GrantAchievement(userId, completedTutorials);
            if (achievement != null)
            {
                TempData["Success"] = $"Congratulations! You've earned the '{achievement.Title}' achievement!";
            }
        }

        return RedirectToAction(nameof(Index));
    }

    // Helper function to grant an achievement based on completed tutorials
    private async Task<Achievement?> GrantAchievement(string userId, int completedTutorials)
    {
        // Define achievements based on the number of completed tutorials
        var achievementsToAward = new Dictionary<int, string>
        {
            { 2, "Pro Kid Award" },
            { 4, "Hero Kid Award" },
            { 6, "Super Grasping & Memory Power Kid Award" },
            { 8, "Incredible Memory Power Award" },
            { 10, "Brilliant Kid Award" },
            { 12, "Youngest Master of G.K. Award" },
            { 14, "Multi-Talented Award" },
            { 16, "Multi-Talented Renowned Award" }
        };

        // Check if there is an achievement for the current number of completed tutorials
        if (achievementsToAward.ContainsKey(completedTutorials))
        {
            var achievementTitle = achievementsToAward[completedTutorials];

            // Find the achievement in the database
            var achievement = await _context.Achievements.FirstOrDefaultAsync(a => a.Title == achievementTitle);

            if (achievement != null)
            {
                // Check if the user already has this achievement
                var hasAchievement = await _context.UserAchievements
                                                   .AnyAsync(ua => ua.UserId == userId && ua.AchievementId == achievement.AchievementId);

                if (!hasAchievement)
                {
                    // Grant the achievement to the user
                    var userAchievement = new UserAchievement
                    {
                        UserId = userId,
                        AchievementId = achievement.AchievementId,
                        EarnedDate = DateTime.Now
                    };

                    _context.UserAchievements.Add(userAchievement);
                    await _context.SaveChangesAsync();

                    return achievement;
                }
            }
        }

        return null;
    }
}
