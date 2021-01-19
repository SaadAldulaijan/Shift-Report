using Shift_Report.Models;

namespace Shift_Report.Services
{
    public interface IEmailService
    {
        void SendEmail(string toEmail, CallerModel caller);
    }
}