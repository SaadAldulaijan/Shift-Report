using Shift_Report.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shift_Report.ViewModels
{
    public class AdminViewModel
    {
        public List<ReportModel> Reports { get; set; } = new List<ReportModel>();
        public List<CallerModel> Callers { get; set; } = new List<CallerModel>();
    }
}