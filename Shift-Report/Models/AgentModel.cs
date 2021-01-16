using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shift_Report.Models
{
    public class AgentModel
    {
        public int Id { get; set; }
        public int BadgeNo { get; set; }
        public string Name { get; set; }
        public string IdentityUserId { get; set; }
        public IdentityUser AspNetUsers { get; set; }
    }
}
