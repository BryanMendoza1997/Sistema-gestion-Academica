using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace PI4
{
    public partial class Aprobacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Conexion con = new Conexion();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText=("select COUNT(*) from TB_PERSONA WHERE ESTADO=0");
            cmd.Connection = con.Conectar();
            int solicitudes =(int)cmd.ExecuteScalar();
            
            if (solicitudes == 0)
            {
                Button2.Visible = false;
            }
            con.cerrar();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string[] cedulas=new string [GridView1.Rows.Count];
            string[] correos = new string[GridView1.Rows.Count];
            string[] ncedulas = new string[GridView1.Rows.Count];
            string[] ncorreos = new string[GridView1.Rows.Count];
            int c = 0;
            int total = 0;
            int aux = 0;
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox check = (row.Cells[4].FindControl("micheckbox") as CheckBox);

                    if (check != null)
                    {
                        if (check.Checked)
                        {
                            correos[total] = GridView1.Rows[c].Cells[3].Text.Trim();
                            cedulas[total] = GridView1.Rows[c].Cells[0].Text.Trim();
                            total++;
                        }
                        else
                        {
                            ncorreos[total] = GridView1.Rows[c].Cells[3].Text.Trim();
                            ncedulas[total] = GridView1.Rows[c].Cells[0].Text.Trim();
                            aux++;
                        }
                    }
                }
                c++;
            }
            try
            {
                for (int i = 0; i < total; i++)
            {
                
                    SqlCommand com = new SqlCommand("EXECUTE spIngresarUsuario  @cedula ");

                    com.Parameters.AddWithValue("@cedula", cedulas[i]);
                    Conexion oad = new Conexion();
                    oad.Ejecutar(com);
            }
            }
            catch (SqlException ex)
            {
                
            }
            try
            {
                for (int i = 0; i < aux; i++)
                {

                    if (ncedulas[i] != null)
                    {
                        SqlCommand com = new SqlCommand("EXECUTE spEliminarPersona  @cedula ");

                        com.Parameters.AddWithValue("@cedula", ncedulas[i]);
                        Conexion oad = new Conexion();
                        oad.Ejecutar(com);
                    }
                }
            }
            catch (SqlException ex)
            {

            }

            Email va;
            for (int i = 0; i < total; i++)
            {
               // va = new Email();
                //va.EnviarCorreo("angel.valle2015@uteq.edu.ec", "deathnote31", correos[i], "Se ha creado su usuario automáticamente con el Usuario= " + cedulas[i] + " y Contraseña= " + cedulas[i]);
                CCorreo objcorreo = new CCorreo(correos[i], "Se ha creado su usuario automáticamente con el Usuario = "+cedulas[i], "Su contraseña es: " + cedulas[i]);
                if (objcorreo.Estado)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + "Se envio el correo exiosamente" + "');</script>");﻿
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + "Error al enviar el correo verifique... <br>" + objcorreo.mensaje_error + "');</script>");﻿
                try
                {
                     
                            SqlCommand com = new SqlCommand("EXECUTE spEliminarPersonaUsuario  @cedula ");

                            com.Parameters.AddWithValue("@cedula", cedulas[i]);
                            Conexion oad = new Conexion();
                            oad.Ejecutar(com);
                     
                }
                catch (SqlException ex)
                {

                }
                }
            }
            for (int i = 0; i < aux; i++)
            {
                if (ncorreos[i] != null)
                {
                    CCorreo objcorreo = new CCorreo(ncorreos[i], "Solicitud denegada", "Su solicitud ha sido denegada, lo sentimos.");
                    if (objcorreo.Estado)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + "Se envio el correo exiosamente" + "');</script>");﻿
                }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + "Error al enviar el correo verifique... <br>" + objcorreo.mensaje_error + "');</script>");﻿
                }
                }
            }
            GridView1.DataBind();
    
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}