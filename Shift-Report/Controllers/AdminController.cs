using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Shift_Report;
using Shift_Report.Models;

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

        public async Task<IActionResult> Index()
        {
            return View(await _ctx.Report.ToListAsync());
        }

        public async Task<IActionResult> Details(int? id)
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

        //public IActionResult Create()
        //{
        //    return View();
        //}

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Create([Bind("Id,Shift,DateTime,Details,DoneBy")] ReportModel reportModel)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        _ctx.Add(reportModel);
        //        await _ctx.SaveChangesAsync();
        //        return RedirectToAction(nameof(Index));
        //    }
        //    return View(reportModel);
        //}

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var reportModel = await _ctx.Report.FindAsync(id);
            if (reportModel == null)
            {
                return NotFound();
            }
            return View(reportModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Shift,DateTime,Details,DoneBy")] ReportModel reportModel)
        {
            if (id != reportModel.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _ctx.Update(reportModel);
                    await _ctx.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ReportModelExists(reportModel.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(reportModel);
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
