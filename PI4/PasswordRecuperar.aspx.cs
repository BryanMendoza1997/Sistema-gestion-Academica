using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace PI4
{
    
    public partial class PasswordRecuperar : System.Web.UI.Page
    {
        Conexion con = new Conexion();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string cedu = TextBox1.Text;
            string correo = TextBox2.Text;
            string contra;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "RecuperarPassword";
            cmd.Connection = con.Conectar();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Correo", SqlDbType.Char, 25).Value = correo;
            cmd.Parameters.Add("@Cedula", SqlDbType.Char, 15).Value = cedu;
            cmd.Parameters.Add("@Contrasenia", SqlDbType.VarChar, -1).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            contra=cmd.Parameters["@Contrasenia"].Value.ToString();
            con.cerrar();
            CCorreo objcorreo = new CCorreo(correo, "Recuperacion de Contraseña","Su contraseña es: " + contra);
            if (objcorreo.Estado)
            {
                Response.Write("Se envio el correo exiosamente");
            }
            else
            {
                Response.Write("Error al enviar el correo verifique... <br>" + objcorreo.mensaje_error);
            }
        }
    }
}