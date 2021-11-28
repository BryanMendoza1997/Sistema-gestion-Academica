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
    public partial class MostrarHorarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View1);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList2.Visible = true;
            Label1.Visible = true;
            if (int.Parse(DropDownList1.SelectedValue) == 0)
            {
                DropDownList2.Visible = false;
                Label1.Visible = false;
                btnEliminar.Visible = false;
                DropDownList3.Visible = false;
                GridView1.DataBind();
                GridView2.DataBind();
            }
            if (DropDownList3.Visible == true)
            {
                DropDownList2.Visible = false;
                DropDownList3.Visible = false;
                DropDownList3.SelectedValue = "0";
                GridView1.DataBind();
                GridView2.DataBind();
                Label1.Visible = false;
                Label2.Visible = false;
                btnEliminar.Visible = false;
            }

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList3.Visible = true;
            Label2.Visible = true;
            if (int.Parse(DropDownList2.SelectedValue) == 0)
            {
                DropDownList3.Visible = false;
                DropDownList2.Visible = false;
                DropDownList3.SelectedValue = "0";
                Label1.Visible = false;
                Label2.Visible = false;
                btnEliminar.Visible = false;
            }
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (int.Parse(DropDownList3.SelectedValue) == 0)
            {
                DropDownList3.Visible = false;
                Label2.Visible = false;
                GridView1.DataBind();
                GridView2.DataBind();
                btnEliminar.Visible = false;
            }
            else
            {
                btnEliminar.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
         
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int semestre = int.Parse(DropDownList3.SelectedValue);
            int periodo = int.Parse(DropDownList1.SelectedValue);
            Conexion con = new Conexion();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "ELIMINARHORARIO";
            cmd.Connection = con.Conectar();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@PERIODO", SqlDbType.Int).Value = periodo;
            cmd.Parameters.Add("@SEMESTREPERIODO", SqlDbType.Int).Value = semestre;
            cmd.Parameters.Add("@MENSAJE", SqlDbType.NVarChar, -1).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            String msj = cmd.Parameters["@MENSAJE"].Value.ToString();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + " " + msj + "');</script>");﻿
            con.cerrar();
            btnEliminar.Visible = false;
            DropDownList3.Visible = false;
            DropDownList2.Visible = false;
            Label1.Visible = false;
            Label2.Visible = false;
            GridView1.DataSource = null;
            GridView2.DataSource = null;
            GridView1.DataBind();
            GridView2.DataBind();
            DropDownList1.SelectedValue = Convert.ToString(0);
           
           
        }
    }
}