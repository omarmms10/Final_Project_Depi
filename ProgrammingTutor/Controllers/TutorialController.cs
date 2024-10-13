using Microsoft.AspNetCore.Mvc;

namespace ProgrammingTutor.Controllers
{
    public class TutorialController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult ScratchTutorials()
        {
            return View();
        }
    }
}
