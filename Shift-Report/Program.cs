using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Shift_Report.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shift_Report
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var host = CreateHostBuilder(args).Build();

            #region users and agents seeded
            var scope = host.Services.CreateScope();

            var ctx = scope.ServiceProvider.GetRequiredService<AppDbContext>();
            var userManager = scope.ServiceProvider.GetRequiredService<UserManager<IdentityUser>>();
            var roleManager = scope.ServiceProvider.GetRequiredService<RoleManager<IdentityRole>>();

            ctx.Database.EnsureCreated();

            #region Add users and roles
            var adminRole = new IdentityRole("Admin");
            var userRole = new IdentityRole("User");

            // Add roles
            if (!ctx.Roles.Any())
            {
                roleManager.CreateAsync(adminRole).GetAwaiter().GetResult();
                roleManager.CreateAsync(userRole).GetAwaiter().GetResult();
            }

            
            if (!ctx.Users.Any())
            {
                // Add Admin and associate to role admin
                var adminUser = new IdentityUser { UserName = "admin", Email = "aldulaijans2@ngha.med.sa" };

                userManager.CreateAsync(adminUser, "P@ssw0rd").GetAwaiter().GetResult();
                userManager.AddToRoleAsync(adminUser, adminRole.Name).GetAwaiter().GetResult();


                // Add Users and associate to role user
                var users = new List<IdentityUser>
                {
                    new IdentityUser { UserName = "Alotaibif10", Email = "Alotaibif10@ngha.med.sa" },
                    new IdentityUser { UserName = "MoteriF", Email = "MoteriF@ngha.med.sa" },
                    new IdentityUser { UserName = "AlotaibiTu13", Email = "AlotaibiTu13@ngha.med.sa" },
                    new IdentityUser { UserName = "ALQAHTANIHA10", Email = "ALQAHTANIHA10@ngha.med.sa" },
                    new IdentityUser { UserName = "alqahtaniam6", Email = "alqahtaniam6@ngha.med.sa" },
                    new IdentityUser { UserName = "BalharethM", Email = "BalharethM@ngha.med.sa" },
                    new IdentityUser { UserName = "ShammaryH3", Email = "ShammaryH3@ngha.med.sa" },
                    new IdentityUser { UserName = "AlsudairiM", Email = "AlsudairiM@ngha.med.sa" },
                    new IdentityUser { UserName = "AlhajriNA2", Email = "AlhajriNA2@ngha.med.sa" },
                    new IdentityUser { UserName = "Aldossarima2", Email = "Aldossarima2@ngha.med.sa" },
                    new IdentityUser { UserName = "HamadFS", Email = "HamadFS@ngha.med.sa" },

                };

                foreach (var item in users)
                {
                    userManager.CreateAsync(item, "Aa@123").GetAwaiter().GetResult();
                    userManager.AddToRoleAsync(item, userRole.Name).GetAwaiter().GetResult();
                }
            }
            #endregion

            #region Add agents to database and associate with their users

            if (!ctx.Agent.Any())
            {

                var Agents = new List<AgentModel>()
                {
                    new AgentModel { Name = "Turki Al Otaibi", BadgeNo = 300508, IdentityUserId = userManager.FindByNameAsync("AlotaibiTu13").GetAwaiter().GetResult().Id },
                    new AgentModel { Name = "Nasser Al Hajri", BadgeNo = 300917, IdentityUserId = userManager.FindByNameAsync("AlhajriNA2").GetAwaiter().GetResult().Id},
                    new AgentModel { Name = "Mohammed Balhareth", BadgeNo = 22177, IdentityUserId = userManager.FindByNameAsync("BalharethM").GetAwaiter().GetResult().Id},
                    new AgentModel { Name = "Fahad Al Mutairy", BadgeNo = 21062, IdentityUserId = userManager.FindByNameAsync("MoteriF").GetAwaiter().GetResult().Id},
                    new AgentModel { Name = "Saad Al Dulaijan", BadgeNo = 300997 , IdentityUserId = userManager.FindByNameAsync("admin").GetAwaiter().GetResult().Id},
                    new AgentModel { Name = "Abdulsalam Al Qahtani", BadgeNo = 300756, IdentityUserId = userManager.FindByNameAsync("alqahtaniam6").GetAwaiter().GetResult().Id},
                    new AgentModel { Name = "Fawaz Al Otaibi", BadgeNo = 23338, IdentityUserId = userManager.FindByNameAsync("Alotaibif10").GetAwaiter().GetResult().Id},
                    new AgentModel { Name = "Mansour Al Dossari", BadgeNo = 400128, IdentityUserId = userManager.FindByNameAsync("Aldossarima2").GetAwaiter().GetResult().Id},
                    new AgentModel { Name = "Mohammed Al Shammary", BadgeNo = 51056, IdentityUserId = userManager.FindByNameAsync("ShammaryH3").GetAwaiter().GetResult().Id},
                    new AgentModel { Name = "Faisal Al Hamed", BadgeNo = 22673, IdentityUserId = userManager.FindByNameAsync("HamadFS").GetAwaiter().GetResult().Id},
                    new AgentModel { Name = "Majed Al Sudairi", BadgeNo = 300820, IdentityUserId = userManager.FindByNameAsync("AlsudairiM").GetAwaiter().GetResult().Id},
                    new AgentModel { Name = "Hamoud Al Qahtani", BadgeNo = 300666, IdentityUserId = userManager.FindByNameAsync("ALQAHTANIHA10").GetAwaiter().GetResult().Id}
                };

                foreach (var item in Agents)
                {
                    ctx.Agent.Add(item);
                    ctx.SaveChangesAsync().GetAwaiter().GetResult();
                }
            }
            #endregion

            #endregion
            host.Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }
}
