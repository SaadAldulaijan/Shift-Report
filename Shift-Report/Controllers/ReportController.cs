using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Shift_Report.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shift_Report.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class ReportController : ControllerBase
    {
        private readonly AppDbContext _ctx;

        public ReportController(AppDbContext ctx)
        {
            _ctx = ctx;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<AgentModel>>> GetAgents()
        {
            return await _ctx.Agent.ToListAsync();
        }

        [HttpPost]
        public async Task<ActionResult<bool>> PostReport([FromBody] ReportModel reportModel)
        {
            ReportModel model = new ReportModel()
            {
                Shift = reportModel.Shift,
                Details = reportModel.Details,
                DateTime = DateTime.Now,
                DoneBy = reportModel.DoneBy,
                CheckList = reportModel.CheckList,
                EODPager = reportModel.EODPager,
            };

            _ctx.Report.Add(model);
            await _ctx.SaveChangesAsync();

            // --------------------------
            foreach (var item in reportModel.AccessCode)
            {

                AccessCodeModel accessCode = new AccessCodeModel()
                {
                    AccessType = item.AccessType,
                    AgentTelephone = item.AgentTelephone,
                    CallerBadge = item.CallerBadge,
                    CallerName = item.CallerName,
                    CallReceiver = item.CallReceiver,
                    TelephoneNo = item.TelephoneNo,
                    ReportId = model.Id
                };

                _ctx.AccessCode.Add(accessCode);
                await _ctx.SaveChangesAsync();
            }

            // ----------------------

            foreach (var item in reportModel.Announcement)
            {
                AnnouncementModel announcement = new AnnouncementModel()
                {
                    DateTime = item.DateTime,
                    DoneBy = item.DoneBy,
                    Subject = item.Subject,
                    ReportId = model.Id
                };
                _ctx.Announcement.Add(announcement);
                await _ctx.SaveChangesAsync();
            }

            //----------------------------------
            foreach (var item in reportModel.Break)
            {
                BreakModel breakModel = new BreakModel()
                {
                    AgentName = item.AgentName,
                    Comment = item.Comment,
                    In = item.In,
                    Out = item.Out,
                    Remark = item.Remark,
                    ReportId = model.Id
                };
                _ctx.Break.Add(breakModel);
                await _ctx.SaveChangesAsync();
            }
            // ------------------------------------
            foreach (var item in reportModel.EmergencyCode)
            {
                EmergencyCodeModel emergencyCode = new EmergencyCodeModel()
                {
                    CallerBadge = item.CallerBadge,
                    CallerExt = item.CallerExt,
                    Code = item.Code,
                    Comment = item.Comment,
                    Location = item.Location,
                    ReceivedBy = item.ReceivedBy,
                    TimeReceived = item.TimeReceived,
                    ReportId = model.Id
                };
                _ctx.EmergencyCode.Add(emergencyCode);
                await _ctx.SaveChangesAsync();
            }

            return Ok(true);
            //return CreatedAtAction("GetReportModel", new { id = reportModel.Id }, reportModel);
        }

    }
}
