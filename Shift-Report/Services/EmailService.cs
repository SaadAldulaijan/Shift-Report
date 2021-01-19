using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;
using Shift_Report.ViewModels;
using Microsoft.Extensions.Options;
using Shift_Report.Models;

namespace Shift_Report.Services
{
    public class EmailService : IEmailService
    {
        private readonly IOptionsMonitor<EmailOptions> _options;
        public EmailService(IOptionsMonitor<EmailOptions> options)
        {
            _options = options;
        }
        public void SendEmail(string toEmail, CallerModel caller)
        {
            var fromAddress = new MailAddress(_options.CurrentValue.FromAddress);
            var toAddress = new MailAddress(toEmail);
            string fromPassword = _options.CurrentValue.FromPassword;
            string subject = _options.CurrentValue.Subject;
            string body = $@"
                        <p>
                            Dear,
                            <br/><br />
                            You have a miss call at {caller.CallDateTime}
                            <br /><br />
                            From {caller.PhoneNo} - {caller.Name}
                            <br /><br />
                            MRN No: {caller.MRN}
                            <br /><br />
                            Asking for: {caller.Inquiry}
                            <br /><br />
                            Best Regards,
                            <br /><br />
                            Communication Department - Call Center
                            <br />
                            This is an Auto Generated Email Do Not Reply 
                        </p>";

            var smtp = new SmtpClient
            {
                Host = _options.CurrentValue.Host,
                Port = _options.CurrentValue.Port,
                EnableSsl = _options.CurrentValue.EnableSsl,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = _options.CurrentValue.UseDefaultCredentials,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };
            using (var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body,
                IsBodyHtml = true
            })
            {
                smtp.Send(message);
            }
        }
    }
}
