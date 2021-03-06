﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Shift_Report;
using Shift_Report.Models;
using Shift_Report.ViewModels;

namespace Shift_Report.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        private readonly AppDbContext _ctx;

        public AdminController(AppDbContext ctx)
        {
            _ctx = ctx;
        }

        public IActionResult Index()
        {
            var vm = new AdminViewModel
            {
                Reports = _ctx.Report.ToList(),
                Callers = _ctx.Caller.Include(x=>x.Department).Include(x=>x.Agent).ToList()
            };
            return View(vm);
        }

        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var reportModel = await _ctx.Report
                .Include(x=>x.CheckList)
                .Include(x=>x.Break)
                .Include(x=>x.EODPager)
                .Include(x=>x.EmergencyCode)
                .Include(x=>x.AccessCode)
                .Include(x=>x.Announcement)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (reportModel == null)
            {
                return NotFound();
            }

            return View(reportModel);
        }

        public async Task<IActionResult> CallerDetails(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var callerModel = await _ctx.Caller
                .Include(x => x.Department)
                .Include(x => x.Agent)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (callerModel == null)
            {
                return NotFound();
            }

            return View(callerModel);
        }
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var reportModel = await _ctx.Report
                .FirstOrDefaultAsync(m => m.Id == id);
            if (reportModel == null)
            {
                return NotFound();
            }

            return View(reportModel);
        }


        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var reportModel = await _ctx.Report.FindAsync(id);
            _ctx.Report.Remove(reportModel);
            await _ctx.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ReportModelExists(int id)
        {
            return _ctx.Report.Any(e => e.Id == id);
        }


    }
}
