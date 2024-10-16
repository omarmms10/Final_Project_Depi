using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using ProgrammingTutor.Models;
using Microsoft.Extensions.Logging; // Ensure to have this namespace for ILogger
using System.Linq; // To use LINQ for querying the database

namespace ProgrammingTutor.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly KidProgrammingContext _context; // Add the DbContext field

        // Modify the constructor to include KidProgrammingContext
        public HomeController(ILogger<HomeController> logger, KidProgrammingContext context)
        {
            _logger = logger;
            _context = context;
        }

        // Modify the Index action to fetch data from the database
        public IActionResult Index()
        {
            // Example: Fetch all tutorials from the database
            var tutorials = _context.Tutorials.ToList();

            // Pass the tutorials to the view
            return View(tutorials);
        }

        public IActionResult WebsiteLayout()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }
        public IActionResult ContactUs()
        {
            return View();
        }
        public IActionResult TermsOfServices()
        {
            return View();
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
