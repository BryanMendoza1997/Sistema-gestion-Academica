using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PI4
{
    public partial class EliminarHorario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Estado() == 0)
                MultiView1.SetActiveView(View1);
            else
                MultiView1.SetActiveView(View2);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Conexion con = new Conexion();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "DeleteHor";
            cmd.Connection = con.Conectar();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@USER", SqlDbType.VarChar, -1).Value = Person.u;
            cmd.ExecuteNonQuery();
            con.cerrar();
            Response.Write("<script language=javascript>alert('Horario Eliminado Exitosamente');</script>");
            Response.Redirect("InicioEstudiante.aspx");
        }
        public int Estado()
        {
            Conexion con = new Conexion();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "spEstadoHora";
            cmd.Connection = con.Conectar();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@USER", SqlDbType.VarChar, -1).Value = Person.u;
            cmd.Parameters.Add("@Cont", SqlDbType.Int, -1).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            int msm = (int)cmd.Parameters["@Cont"].Value;
            con.cerrar();
            return msm;

        }

    }
}