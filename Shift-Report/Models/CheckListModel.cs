using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Shift_Report.Models
{
    public class CheckListModel
    {
        public int Id { get; set; }
        /// <summary>
        /// check list
        /// </summary>
        public bool Workplace { get; set; }
        public bool Directories { get; set; }
        public bool Boards { get; set; }
        public bool Fax1 { get; set; }
        public bool Fax2 { get; set; }
        public bool Overhead { get; set; }
        public bool EmergencyLine { get; set; }
        public bool Hotline { get; set; }
        public bool BackupHotline { get; set; }
        public bool CodeYellow { get; set; }
        public bool PagingTelephone { get; set; }

        /// <summary>
        /// Equipment 
        /// </summary>
        public int NoOfBattery { get; set; }
        public int NoOfPager { get; set; }
        public int NoOfChair { get; set; }
        public int NoOfUndeliveredFax { get; set; }
        public int NoOfDictaphone { get; set; }
        public int NoOfHeadphone { get; set; }
        public int NoOfRadiophones { get; set; }
        public int NoOfRadiophonesCharger { get; set; }
        public int NoOfRemoteControl { get; set; }

        // Relationship
        public int ReportId { get; set; }
        public ReportModel Report { get; set; }
    }
}