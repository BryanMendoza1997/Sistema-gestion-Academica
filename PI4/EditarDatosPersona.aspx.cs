using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PI4
{
    public partial class EditarDatosPersona : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSiguientePersonal_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View2);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View1);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand com = new SqlCommand("EXECUTE spEditarDatosPersona @nombres,@apellidos,@cedula,@celular,@correo,@carrera");

                com.Parameters.AddWithValue("@nombres", txtNombres.Text);
                com.Parameters.AddWithValue("@apellidos", (txtApellidos.Text));
                com.Parameters.AddWithValue("@cedula", txtCedula.Text);
                com.Parameters.AddWithValue("@celular", (txtTelefono.Text));
                com.Parameters.AddWithValue("@correo", (txtCorreo.Text));
                com.Parameters.AddWithValue("@carrera", (int.Parse(DropDownList2.SelectedValue.ToString())));
                Conexion con = new Conexion();
                com.Connection = con.Conectar();
                com.ExecuteNonQuery();

                txtCedula.Text = "";
                txtNombres.Text = "";
                txtApellidos.Text = "";
                txtTelefono.Text = "";

                txtCorreo.Text = "";
                con.cerrar();

            }
            catch (SqlException ex)
            {
                Label16.Text = ex.Message.ToString();
            }
            MultiView1.SetActiveView(View4);
        }
    }
}