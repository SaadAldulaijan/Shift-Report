using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shift_Report.Models
{
    public class EODPagerModel
    {
        /// <summary>
        /// EOD Pager info
        /// </summary>
        public int Id { get; set; }
        public string PagerReceivedFrom { get; set; }
        public DateTime PagerReceivedAt { get; set; }
        public string PagerReceivedBy { get; set; }
        public string PagerIssuedTo { get; set; }
        public DateTime PagerIssuedAt { get; set; }
        public string PagerIssuedBy { get; set; }

        // Relationship
        public int ReportId { get; set; }
        public ReportModel Report { get; set; }
    }
}
