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
    public partial class Docente : System.Web.UI.Page
    {
        Conexion con = new Conexion();
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View1);
          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextCedula.Enabled = true;
            if (validadorDeCedula((TextCedula.Text.Trim().ToCharArray())))
            {
                if (Textid.Text.Trim().Equals(""))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "Execute INSERTARDOCENTE @nombres ,@apellidos ,@cedula , @celular, @correo";
                    cmd.Connection = con.Conectar();
                    cmd.Parameters.AddWithValue("@nombres", TextNombre.Text.Trim());
                    cmd.Parameters.AddWithValue("@apellidos", TextApellido.Text.Trim());
                    cmd.Parameters.AddWithValue("@cedula", TextCedula.Text.Trim());
                    cmd.Parameters.AddWithValue("@celular", TextCelular.Text.Trim());
                    cmd.Parameters.AddWithValue("@correo", TextCorreo.Text.Trim());
                    cmd.ExecuteNonQuery();
                    con.cerrar();
                }
                else
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = " Execute ActualizarDocente @id ,@nombres ,@apellidos ,@cedula , @celular, @correo";
                    cmd.Connection = con.Conectar();
                    cmd.Parameters.AddWithValue("@id", int.Parse(Textid.Text.Trim()));
                    cmd.Parameters.AddWithValue("@nombres", TextNombre.Text.Trim());
                    cmd.Parameters.AddWithValue("@apellidos", TextApellido.Text.Trim());
                    cmd.Parameters.AddWithValue("@cedula", TextCedula.Text.Trim());
                    cmd.Parameters.AddWithValue("@celular", TextCelular.Text.Trim());
                    cmd.Parameters.AddWithValue("@correo", TextCorreo.Text.Trim());
                    cmd.ExecuteNonQuery();
                    con.cerrar();
                }
                limpiarcajas();
                GridView1.DataBind();
                MultiView1.SetActiveView(View1);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + "Error en numero de cedula" + "');</script>");﻿
                //limpiarcajas();
                MultiView1.SetActiveView(View3);
            }
        }
        public bool validadorDeCedula(char[] validarCedula)
        {
            int aux = 0, par = 0, impar = 0, verifi;
            for (int i = 0; i < 9; i += 2)
            {
                aux = 2 * int.Parse(validarCedula[i].ToString());
                if (aux > 9)
                    aux -= 9;
                par += aux;
            }
            for (int i = 1; i < 9; i += 2)
            {
                impar += int.Parse(validarCedula[i].ToString());
            }

            aux = par + impar;
            if (aux % 10 != 0)
            {
                verifi = 10 - (aux % 10);
            }
            else
                verifi = 0;
            if (verifi == int.Parse(validarCedula[9].ToString()))
                return true;
            else
                return false;
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View3);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.SetActiveView(View2);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            limpiarcajas();
            MultiView1.SetActiveView(View1);
            TextCedula.Enabled = true;
        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
         
        }
        public void limpiarcajas()
        {
            Textid.Text = "";
            TextApellido.Text = "";
            TextNombre.Text = "";
            TextCedula.Text = "";
            TextCorreo.Text = "";
            TextCelular.Text = "";
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void LinkButton1_Click2(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click3(object sender, EventArgs e)
        {
            
        }

        protected void LinkButton1_Click4(object sender, EventArgs e)
        {
            //TextNombre.Text = GridView1.SelectedRow.Cells[0].Text;
            //MultiView1.SetActiveView(View3);
        }

        protected void UpdateButton_Click1(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
          
          
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
            MultiView1.SetActiveView(View1);
        }

        protected void BtnActualizar_Click(object sender, EventArgs e)
        {
       
        //    limpiarcajas();
        //    GridView1.DataBind();
        //    MultiView1.SetActiveView(View1);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            int a = row.RowIndex;
            TextCedula.Text = GridView1.SelectedRow.Cells[3].Text.Trim();
            TextNombre.Text = GridView1.SelectedRow.Cells[4].Text.Trim();
            TextApellido.Text = GridView1.SelectedRow.Cells[5].Text.Trim();
            TextCorreo.Text = GridView1.SelectedRow.Cells[6].Text.Trim();
            TextCelular.Text = GridView1.SelectedRow.Cells[7].Text.Trim();
            Textid.Text = GridView1.DataKeys[a].Values[1].ToString().Trim();
            MultiView1.SetActiveView(View3);
            TextCedula.Enabled = false;
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Conexion con = new Conexion();
            LinkButton b = (LinkButton)sender;
            int id = int.Parse(b.CommandArgument);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection=con.Conectar();
            cmd.CommandText = ("Execute ELIMINARDOCENTE @id");
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            GridView1.DataBind();
            con.cerrar();
        }

    }
}