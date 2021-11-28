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
    public partial class InicioAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Conexion con = new Conexion();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select COUNT(*) from TB_DOCENTE";
            cmd.Connection = con.Conectar();
            int numero =(int)cmd.ExecuteScalar();
            LabelNumerodeDocentes.Text = Convert.ToString(numero);
            con.cerrar();
            SqlCommand cmdE = new SqlCommand();
            cmdE.CommandText = "select COUNT(*) from TB_PERSONA INNER JOIN TB_ESTUDIANTE ON TB_PERSONA.ID_PERSONA=TB_ESTUDIANTE.ID_PERSONA INNER JOIN TB_USUARIO ON TB_ESTUDIANTE.ID_ESTUDIANTE=TB_USUARIO.ID_ESTUDIANTE";
            cmdE.Connection = con.Conectar();
            int estudiantes = (int)cmdE.ExecuteScalar();
            LabelEstudiante.Text = Convert.ToString(estudiantes);
            con.cerrar();
            
            cmdE = new SqlCommand();
            cmdE.CommandText = "select COUNT(*) from TB_PERSONA WHERE ESTADO=0";
            cmdE.Connection = con.Conectar();
            int solicitudes = (int)cmdE.ExecuteScalar();
            LabelSolicitudes.Text = Convert.ToString(solicitudes);
            if (solicitudes > 0)
            {
                LabelSolicitudes.ForeColor = System.Drawing.Color.Red;
            }
            con.cerrar();
        }
    }
}