using System;

namespace Shift_Report.Models
{
    public class AnnouncementModel
    {
        public int Id { get; set; }
        public string Subject { get; set; }
        public DateTime DateTime { get; set; }
        public string DoneBy { get; set; }

        //Relationships
        public int ReportId { get; set; }
        public ReportModel Report { get; set; }
    }
}