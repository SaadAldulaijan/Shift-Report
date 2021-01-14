using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Shift_Report.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shift_Report
{
    public class AppDbContext : IdentityDbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<ReportModel> Report { get; set; }
        public DbSet<EODPagerModel> EODPager { get; set; }
        public DbSet<CheckListModel> CheckList { get; set; }
        public DbSet<BreakModel> Break { get; set; }
        public DbSet<EmergencyCodeModel> EmergencyCode { get; set; }
        public DbSet<AccessCodeModel> AccessCode { get; set; }
        public DbSet<AnnouncementModel> Announcement { get; set; }
        public DbSet<AgentModel> Agent { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
        }
    }
}
