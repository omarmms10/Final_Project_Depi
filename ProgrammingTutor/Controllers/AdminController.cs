using Microsoft.AspNetCore.Mvc;
using ProgrammingTutor.Models;
using Microsoft.AspNetCore.Identity;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

[Authorize(Roles = "Admin")]  // Only Admins can access these actions
public class AdminController : Controller
{
    private readonly KidProgrammingContext _context;
    private readonly UserManager<IdentityUser> _userManager;
    private readonly RoleManager<IdentityRole> _roleManager;

    public AdminController(KidProgrammingContext context, UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager)
    {
        _context = context;
        _userManager = userManager;
        _roleManager = roleManager;
    }

    // ************** TUTORIAL MANAGEMENT **************

    // GET: /Admin/Tutorials
    public async Task<IActionResult> Tutorials()
    {
        var tutorials = await _context.Tutorials.ToListAsync();
        return View(tutorials);
    }

    // GET: /Admin/AddTutorial
    public IActionResult AddTutorial()
    {
        return View();
    }

    // POST: /Admin/AddTutorial
    [HttpPost]
    public async Task<IActionResult> AddTutorial(Tutorial tutorial)
    {
        if (ModelState.IsValid)
        {
            tutorial.CreatedDate = DateTime.Now;
            _context.Tutorials.Add(tutorial);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Tutorials));
        }
        return View(tutorial);
    }

    // GET: /Admin/EditTutorial/{id}
    public async Task<IActionResult> EditTutorial(int id)
    {
        var tutorial = await _context.Tutorials.FindAsync(id);
        if (tutorial == null)
        {
            return NotFound();
        }
        return View(tutorial);
    }

    // POST: /Admin/EditTutorial/{id}
    [HttpPost]
    public async Task<IActionResult> EditTutorial(int id, Tutorial updatedTutorial)
    {
        if (id != updatedTutorial.TutorialId)
        {
            return NotFound();
        }

        if (ModelState.IsValid)
        {
            var tutorial = await _context.Tutorials.FindAsync(id);
            if (tutorial != null)
            {
                tutorial.Title = updatedTutorial.Title;
                tutorial.Description = updatedTutorial.Description;
                tutorial.Level = updatedTutorial.Level;
                tutorial.Duration = updatedTutorial.Duration;

                _context.Tutorials.Update(tutorial);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Tutorials));
            }
        }
        return View(updatedTutorial);
    }

    // POST: /Admin/DeleteTutorial/{id}
    [HttpPost]
    [HttpPost]
    [HttpPost]
    public async Task<IActionResult> DeleteTutorial(int id)
    {
        // Find the tutorial
        var tutorial = await _context.Tutorials.FindAsync(id);

        if (tutorial != null)
        {
            // Find and delete related progress entries
            var relatedProgress = _context.Progresses.Where(p => p.TutorialId == id);
            _context.Progresses.RemoveRange(relatedProgress);  // Remove related progress entries

            // Remove the tutorial
            _context.Tutorials.Remove(tutorial);
            await _context.SaveChangesAsync();
        }

        return RedirectToAction(nameof(Tutorials));
    }



    // ************** FEEDBACK MANAGEMENT **************

    // GET: /Admin/FeedbackList
    // GET: /Admin/FeedbackList
    public async Task<IActionResult> FeedbackList()
    {
        var feedbackList = await _context.Feedbacks
                                         .Include(f => f.User)
                                         .Include(f => f.Tutorial)
                                         .ToListAsync();

        return View(feedbackList);
    }


    // POST: /Admin/DeleteFeedback/{id}
    [HttpPost]
    public async Task<IActionResult> DeleteFeedback(int feedbackId)
    {
        var feedback = await _context.Feedbacks.FindAsync(feedbackId);
        if (feedback != null)
        {
            _context.Feedbacks.Remove(feedback);
            await _context.SaveChangesAsync();
        }

        return RedirectToAction(nameof(FeedbackList));
    }

    // ************** USER MANAGEMENT **************

    // GET: /Admin/UserManagement
    public async Task<IActionResult> UserManagement()
    {
        var users = await _userManager.Users.ToListAsync();
        var userRolesViewModel = new List<UserRolesViewModel>();

        foreach (var user in users)
        {
            var roles = await _userManager.GetRolesAsync(user);
            userRolesViewModel.Add(new UserRolesViewModel
            {
                User = user,
                Roles = roles.ToList()
            });
        }

        return View(userRolesViewModel);
    }


    // GET: /Admin/ManageUser/{id}
    public async Task<IActionResult> ManageUser(string id)
    {
        var user = await _userManager.FindByIdAsync(id);
        if (user == null)
        {
            return NotFound();
        }

        var userRoles = await _userManager.GetRolesAsync(user);
        var allRoles = _roleManager.Roles.ToList();

        var viewModel = new ManageUserViewModel
        {
            User = user,
            UserRoles = userRoles.ToList(),
            AllRoles = allRoles
        };

        return View(viewModel);
    }

    // POST: /Admin/UpdateUserRoles/{id}
    [HttpPost]
    public async Task<IActionResult> UpdateUserRoles(string userId, List<string> roles)
    {
        var user = await _userManager.FindByIdAsync(userId);
        if (user == null)
        {
            return NotFound();
        }

        var currentRoles = await _userManager.GetRolesAsync(user);
        var result = await _userManager.RemoveFromRolesAsync(user, currentRoles);

        if (!result.Succeeded)
        {
            TempData["Error"] = "Failed to update user roles.";
            return RedirectToAction("ManageUser", new { id = userId });
        }

        result = await _userManager.AddToRolesAsync(user, roles);
        if (result.Succeeded)
        {
            TempData["Success"] = "User roles updated successfully!";
        }

        return RedirectToAction("ManageUser", new { id = userId });
    }

    // POST: /Admin/DeleteUser/{id}
    [HttpPost]
    public async Task<IActionResult> DeleteUser(string id)
    {
        var user = await _userManager.FindByIdAsync(id);
        if (user != null)
        {
            await _userManager.DeleteAsync(user);
            TempData["Success"] = "User deleted successfully!";
        }
        return RedirectToAction(nameof(UserManagement));
    }

    // ************** USER PROGRESS VIEW **************

    // GET: /Admin/ViewUserProgress/{id}
    public async Task<IActionResult> ViewUserProgress(string id)
    {
        var user = await _userManager.FindByIdAsync(id);
        if (user == null)
        {
            return NotFound();
        }

        var progressList = await _context.Progresses
                                         .Include(p => p.Tutorial)
                                         .Where(p => p.UserId == user.Id)
                                         .ToListAsync();

        var achievements = await _context.UserAchievements
                                         .Include(ua => ua.Achievement)
                                         .Where(ua => ua.UserId == user.Id)
                                         .ToListAsync();

        var viewModel = new UserProgressViewModel
        {
            User = user,
            ProgressList = progressList,
            Achievements = achievements
        };

        return View(viewModel);
    }
}
