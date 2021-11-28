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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                if (Estado() == 0)
                {
                    MultiView1.SetActiveView(View1);
                }
                else
                {
                    MultiView1.SetActiveView(View2);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarHorario.aspx");
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