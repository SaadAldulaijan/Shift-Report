using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shift_Report.Models
{
    public class ReportModel
    {
        public int Id { get; set; }
        public string Shift { get; set; }
        public DateTime DateTime { get; set; } = DateTime.Now;
        public string Details { get; set; }
        // username
        public string DoneBy { get; set; }

        /// <summary>
        /// Relationships
        /// </summary>
        public  CheckListModel CheckList { get; set; }
        public IList<BreakModel> Break { get; set; } = new List<BreakModel>();
        public  EODPagerModel EODPager { get; set; }
        public IList<EmergencyCodeModel> EmergencyCode { get; set; } = new List<EmergencyCodeModel>();
        public IList<AccessCodeModel> AccessCode { get; set; } = new List<AccessCodeModel>();
        public IList<AnnouncementModel> Announcement { get; set; } = new List<AnnouncementModel>();

    }
}
