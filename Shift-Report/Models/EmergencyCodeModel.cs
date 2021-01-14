using System;

namespace Shift_Report.Models
{
    public class EmergencyCodeModel
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Location { get; set; }
        public string CallerBadge { get; set; }
        public string CallerExt { get; set; }
        public string ReceivedBy { get; set; }
        public DateTime TimeReceived { get; set; }
        public string Comment { get; set; }

        // Relationships
        public int ReportId { get; set; }
        public ReportModel Report { get; set; }
    }
}