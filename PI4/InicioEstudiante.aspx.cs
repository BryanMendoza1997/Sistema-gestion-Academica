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
    public partial class InicioStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int usuario = Person.u;
            Session["usuario"] = usuario;
            Conexion con = new Conexion();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT COUNT(*) FROM TB_NOTIFICACIONES WHERE ID_USUARIO="+usuario+"";
            cmd.Connection = con.Conectar();
            int numero = (int)cmd.ExecuteScalar();
            LabelSolicitudes.Text = Convert.ToString(numero);
            con.cerrar();
        }
    }
}