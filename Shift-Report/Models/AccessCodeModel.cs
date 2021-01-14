namespace Shift_Report.Models
{
    public class AccessCodeModel
    {
        // Add access code use time
        public int Id { get; set; }
        public string AccessType { get; set; }
        public string CallerName { get; set; }
        public string CallerBadge { get; set; }
        public string CallReceiver { get; set; }
        public string TelephoneNo { get; set; }
        public string AgentTelephone { get; set; }

        //Relationship
        public int ReportId { get; set; }
        public ReportModel Report { get; set; }
    }
}