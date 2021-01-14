namespace Shift_Report.Models
{
    public class BreakModel
    {
        public int Id { get; set; }
        public string AgentName { get; set; }
        public string Remark { get; set; }
        public string Out { get; set; }
        public string In { get; set; }
        public string Comment { get; set; }

        // Relationship
        public int ReportId { get; set; }
        public ReportModel Report { get; set; }
    }
}