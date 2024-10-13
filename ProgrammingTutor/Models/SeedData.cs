using Microsoft.AspNetCore.Identity;
using System.Threading.Tasks;

namespace ProgrammingTutor.Models
{
    public static class SeedData
    {
        public static async Task Initialize(UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            // Define roles
            string[] roleNames = { "Admin", "Kid", "Parent" };
            IdentityResult roleResult;

            // Create roles if they don't exist
            foreach (var roleName in roleNames)
            {
                var roleExist = await roleManager.RoleExistsAsync(roleName);
                if (!roleExist)
                {
                    roleResult = await roleManager.CreateAsync(new IdentityRole(roleName));
                }
            }

            // Create a default admin user if it doesn't exist
            var adminEmail = "admin@programmingtutor.com";
            var adminUser = await userManager.FindByEmailAsync(adminEmail);

            if (adminUser == null)
            {
                var newAdminUser = new IdentityUser
                {
                    UserName = adminEmail,
                    Email = adminEmail,
                    EmailConfirmed = true
                };
                string adminPassword = "Admin123!";
                var createAdminUser = await userManager.CreateAsync(newAdminUser, adminPassword);

                if (createAdminUser.Succeeded)
                {
                    // Add the admin user to the Admin role
                    await userManager.AddToRoleAsync(newAdminUser, "Admin");
                }
            }
        }
    }
}
