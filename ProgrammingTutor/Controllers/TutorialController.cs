using Microsoft.AspNetCore.Mvc;
using ProgrammingTutor.Models;
using System.Linq;  // Assuming you're using LINQ and Entity Framework

namespace ProgrammingTutor.Controllers
{
    public class TutorialController : Controller
    {
        private readonly KidProgrammingContext _context;

        public TutorialController(KidProgrammingContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            // Fetch all tutorials from the database
            var tutorials = _context.Tutorials.ToList();
            return View(tutorials);
        }

        // Action to load a specific tutorial
        public IActionResult Detail(int id)
        {
            var tutorial = _context.Tutorials.FirstOrDefault(t => t.TutorialId == id);
            if (tutorial == null)
            {
                return NotFound();
            }
            return View(tutorial);
        }
    }
}
