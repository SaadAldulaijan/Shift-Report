using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Shift_Report.Models
{
    public class CallerModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        [DataType(DataType.PhoneNumber)]
        public string PhoneNo { get; set; }
        public string Inquiry { get; set; }
        public string MRN { get; set; }
        public int AgentId { get; set; }
        public AgentModel Agent { get; set; }
        public int DepartmentId { get; set; }
        public DepartmentModel Department { get; set; }
        [DataType(DataType.DateTime)]
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime CallDateTime { get; set; } = DateTime.Now;
    }
}
