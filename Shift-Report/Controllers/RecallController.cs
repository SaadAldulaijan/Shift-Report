using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Shift_Report.Models;
using Shift_Report.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shift_Report.Controllers
{
    [Authorize]
    public class RecallController : Controller
    {
        private readonly AppDbContext _ctx;
        private readonly IEmailService _email;

        public RecallController(AppDbContext ctx, IEmailService email)
        {
            _ctx = ctx;
            _email = email;
        }

        [HttpGet]
        public IActionResult Index()
        {
            ViewData["Agents"] = new SelectList(_ctx.Agent, "Id", "Name");
            ViewData["Departments"] = new SelectList(_ctx.Department, "Id", "Name");
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> PostRecall(CallerModel caller)
        {
            if (ModelState.IsValid)
            {
                // Send Email First
                var toEmail = _ctx.Department.Where(x => x.Id == caller.DepartmentId).Select(x => x.Email).FirstOrDefault();
                _email.SendEmail(toEmail, caller);
                // Then save to db.
                _ctx.Caller.Add(caller);
                await _ctx.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return BadRequest(caller);
        }
    }
}
