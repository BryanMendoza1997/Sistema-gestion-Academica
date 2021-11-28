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
    public partial class ModificarHorario : System.Web.UI.Page
    {
        Conexion con = new Conexion();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Person.c.ToString();
            Label5.Text = Person.u.ToString();
            Label4.Text = Person.u.ToString();
            if (Estado() == 0)
                MultiView1.SetActiveView(View1);
            else
                MultiView1.SetActiveView(View2);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            MultiView2.Visible = true;
            if (DropDownList1.SelectedIndex==1)
            {
                MultiView2.SetActiveView(View3);
            }
            else if (DropDownList1.SelectedIndex == 2)
            {
                MultiView2.SetActiveView(View4);
            }
            else
            {
                MultiView2.Visible = false;
            }
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

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SPAgregarM";
            cmd.Connection = con.Conectar();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@IDM", SqlDbType.Int, -1).Value = GridView4.SelectedValue;
            cmd.Parameters.Add("@IDU", SqlDbType.Int, -1).Value = int.Parse(Label5.Text);
            cmd.Parameters.Add("@mensaje", SqlDbType.NVarChar, -1).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            if (cmd.Parameters["@mensaje"].Value.ToString() != "Ingresado correcto")
            {
                Response.Write("<script language=javascript>alert('" + cmd.Parameters["@mensaje"].Value + "');</script>");
                con.cerrar();
            }
            else
            {
                Response.Write("<script language=javascript>alert('Materia Agregada Exitosamente');</script>");
                GridView1.DataBind();
                GridView2.DataBind();
                con.cerrar();
            }
            MultiView2.Visible = false;
            DropDownList1.SelectedIndex = 0;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            int id = int.Parse(b.ToolTip);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "DeleteMateria";
            cmd.Connection = con.Conectar();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@USER", SqlDbType.Int, -1).Value = int.Parse(Label5.Text);
            cmd.Parameters.Add("@IDM", SqlDbType.Int, -1).Value = id;
            cmd.ExecuteNonQuery();
            Response.Write("<script language=javascript>alert('Materia Eliminada Exitosamente');</script>");
            GridView1.DataBind();
            GridView2.DataBind();
            con.cerrar();
            MultiView2.Visible = false;
            Response.Redirect("ModificarHorario.aspx");
        }
    }
}