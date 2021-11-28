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
    public partial class loguin : System.Web.UI.Page
    {
        Conexion con = new Conexion();
        public Person n = new Person();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            String Usuario = Login1.UserName;
            String Password = Login1.Password;   
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "LOGUEO";
            cmd.Connection = con.Conectar();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = Password;
            cmd.Parameters.Add("@Usuario", SqlDbType.Char).Value = Usuario;
            cmd.Parameters.Add("@Bandera", SqlDbType.Int).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@Bandera1", SqlDbType.Int).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            int ban = (int)cmd.Parameters["@Bandera"].Value;
            int ban1 = (int)cmd.Parameters["@Bandera1"].Value;
            if (ban == 1)
            {
                e.Authenticated = true;
                n.Persona(ban1);
                Datos_User();
                Horario();
                Response.Redirect("InicioEstudiante.aspx");

            }
            else if (ban == 2)
            {
                e.Authenticated = true;
                Response.Redirect("InicioAdministrador.aspx");
            }
            else
            {
                e.Authenticated = false;
            }
            con.cerrar();
        }
        public void Horario()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SPHORARIOS";
            cmd.Connection = con.Conectar();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@IDUSER", SqlDbType.Int, -1).Value = Person.u;
            cmd.Parameters.Add("@Mensaje", SqlDbType.Int, -1).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            n.mensaje((int)cmd.Parameters["@Mensaje"].Value);
            con.cerrar();
        }
        public void Datos_User()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SPUSERCARRER";
            cmd.Connection = con.Conectar();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ID", SqlDbType.VarChar, -1).Value = Person.p;
            cmd.Parameters.Add("@IDCARR", SqlDbType.Int, -1).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@IDUSER", SqlDbType.Int, -1).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            n.Carrera((int)cmd.Parameters["@IDCARR"].Value);
            n.User((int)cmd.Parameters["@IDUSER"].Value);
            con.cerrar();
        }

    }

}