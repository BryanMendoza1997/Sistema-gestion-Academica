using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace PI4
{
    public class CCorreo
    {
        Boolean estado = true;
        String merror;
        public CCorreo(String destinatario,String asunto,String mensaje)
        {
            MailMessage correo = new MailMessage();
            SmtpClient protocolo = new SmtpClient();
            correo.To.Add(destinatario);
            correo.From = new MailAddress("fabricio.mera96@outlook.es", "Fabricio bano", System.Text.Encoding.UTF8);
            correo.Subject = asunto;
            correo.SubjectEncoding = System.Text.Encoding.UTF8;
            correo.Body = mensaje;
            correo.BodyEncoding = System.Text.Encoding.UTF8;
            correo.IsBodyHtml = false;
            protocolo.Credentials = new System.Net.NetworkCredential("fabricio.mera96@outlook.es", "0504253527Fa");
            protocolo.Port = 587;
            protocolo.Host = "smtp-mail.outlook.com";
            protocolo.EnableSsl = true;
            try
            {
                protocolo.Send(correo);
            }
            catch (SmtpException error)
            {
                estado = false;
                merror = error.Message.ToString();
            }

        }
        public Boolean Estado
        {
            get { return estado; }
        }
        public string mensaje_error
        {
            get { return merror; }
        }
    }
}