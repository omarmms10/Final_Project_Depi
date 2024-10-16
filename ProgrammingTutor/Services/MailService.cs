using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.Extensions.Configuration;
using SendGrid;
using SendGrid.Helpers.Mail;
using System.Net.Mail;
using System.Threading.Tasks;

public class EmailSender : IEmailSender
{
    private readonly IConfiguration _configuration;

    public EmailSender(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    public async Task SendEmailAsync(string email, string subject, string message)
    {
        var apiKey = _configuration["SendGrid:ApiKey"];
        var client = new SendGridClient(apiKey);
        var from = new EmailAddress("mostafaelhadidy442@gmail.com", "ProgrammingTutor");
        var to = new EmailAddress(email);
        var msg = MailHelper.CreateSingleEmail(from, to, subject, message, message);
        await client.SendEmailAsync(msg);
    }
}
