using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
namespace ProyectoIntegrador.FacultadCarrera
{
    public partial class fw_FacultadCarrera : System.Web.UI.Page
    {
        FacultadCarrera.CargarTreeView.LlenarTreeView_FC lt = new CargarTreeView.LlenarTreeView_FC();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void ActivarHorario()
        {
            btnHorario.BackColor = SystemColors.ControlDarkDark;
            btnHorario.ForeColor = SystemColors.ControlLightLight;
            btnHorario.Font.Bold = true;
            Label3.Visible = false;
            ///No seleccionado
            btnMalla.BackColor = SystemColors.ControlLight;
            btnMalla.ForeColor = SystemColors.ControlDarkDark;
            btnMalla.Font.Bold = true;

            trvFacultad.Visible = false;

        }
        private void ActivarMalla()
        {
            btnMalla.BackColor = SystemColors.ControlDarkDark;
            btnMalla.ForeColor = SystemColors.ControlLightLight;
            btnMalla.Font.Bold = true;
            ///No seleccionado
            btnHorario.BackColor = SystemColors.ControlLight;
            btnHorario.ForeColor = SystemColors.ControlDarkDark;
            btnHorario.Font.Bold = true;      
            lt.LlenarTreeView(trvFacultad);
        }
       
        protected void btnMalla_Click(object sender, EventArgs e)
        {
            ActivarMalla();

        }

        protected void btnHorario_Click(object sender, EventArgs e)
        {
            ActivarHorario();
        }

        protected void trvFacultad_SelectedNodeChanged(object sender, EventArgs e)
        {
            Label3.Visible = true;
            Label3.Text=trvFacultad.SelectedNode.Text;
            MultiView1.SetActiveView(View1);
            lt.ConsultarImagenes(Label3.Text, Repeater1);

        }
    }
}