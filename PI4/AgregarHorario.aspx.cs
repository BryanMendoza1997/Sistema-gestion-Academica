using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace PI4
{
    public partial class AgregarHorario : System.Web.UI.Page
    {
        Conexion con = new Conexion();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (IsPostBack == false)
                {
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = "spRespald";
                        cmd.Connection = con.Conectar();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.ExecuteNonQuery();
                        con.cerrar();
                        MultiView1.SetActiveView(View2);
                        Label1.Text = Person.c.ToString();
                        Label5.Text = Person.u.ToString();
                        Button3.Enabled = false;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                int num = e.Row.Cells.Count;
                for (int i = 0; i < num -1 ; i++)
                {
                    e.Row.Cells[i].HorizontalAlign = HorizontalAlign.Center;
                }
            }
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SPAgregar";
            cmd.Connection = con.Conectar();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@IDM", SqlDbType.Int, -1).Value = GridView3.SelectedValue;
            cmd.Parameters.Add("@IDU", SqlDbType.Int, -1).Value = int.Parse(Label5.Text);
            cmd.Parameters.Add("@mensaje", SqlDbType.NVarChar, -1).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            if (cmd.Parameters["@mensaje"].Value.ToString() != "Ingresado correcto")
            {
                Response.Write("<script language=javascript>alert('" + cmd.Parameters["@mensaje"].Value + "');</script>");
            }
            else
            {
                GridView2.DataBind();
                con.cerrar();
                Button3.Enabled = true;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("InicioEstudiantes.aspx");
        }

        protected void Button3_Click1(object sender, EventArgs e)
        {
            
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int y = 0;
        }

        protected void Button3_Click2(object sender, EventArgs e)
        {
            
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "spGuardar";
            cmd.Connection = con.Conectar();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            Person.m = -1;
            Response.Redirect("InicioEstudiante.aspx");
            con.cerrar();
        }

        protected void Button2_Click2(object sender, EventArgs e)
        {
            Response.Redirect("InicioEstudiante.aspx");
        }

        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

    }
}