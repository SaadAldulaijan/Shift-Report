using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shift_Report.Controllers
{
    [Authorize]
    public class DashboardController : Controller
    {
        /* TODO's: 
         * Get Chartjs library
         * Get all shift reports.
         * Get all Recall records.

         * Get agents activities.
         * Calculate agent breaks
        */
        public IActionResult Index()
        {
            return View();
        }
    }
}
