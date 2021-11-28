using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;



namespace PI4
{
    public class Email
    {
        MailMessage m = new MailMessage();
        SmtpClient smpt = new SmtpClient();

        public bool EnviarCorreo(string from , string password, string to,string mensaje)
        {
            try
            {
                m.From = new MailAddress(from);//EMISOR
                m.To.Add(new MailAddress(to));
                m.Body = mensaje;
                m.Subject = "RESPUESTA A SOLICITUD DE ACTIVACIÓN DE CUENTA";
                smpt.Host = "smtp.gmail.com";//servidor de correo
                smpt.Port = 587;//puerto de gmail por defecto
                smpt.Credentials = new NetworkCredential(from,password);
                smpt.EnableSsl = true;
                smpt.Send(m);
                //m.IsBodyHtml = true;

                return true;
            }
            catch (Exception)
            {

                return false;
            }

        }
    }
}