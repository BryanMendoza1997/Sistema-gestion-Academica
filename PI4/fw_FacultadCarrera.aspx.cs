using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PI4
{
    public partial class fw_FacultadCarrera : System.Web.UI.Page
    {
        LlenarTreeView_FC lt = new LlenarTreeView_FC();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void ActivarHorario()
        {
            btnHorario.BackColor = SystemColors.ControlDarkDark;
            btnHorario.ForeColor = SystemColors.ControlLightLight;
            btnHorario.Font.Bold = true;
            Label1.Visible = false;
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
            trvFacultad.Visible = true;
        }

        protected void btnMalla_Click(object sender, EventArgs e)
        {

            ActivarMalla();
            lt.LlenarTreeView(trvFacultad);


        }
        protected void btnHorario_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View2);
            ActivarHorario();
            Label1.Visible = false;
            CargarListadImagenes();
           
        

        }
        private void CargarListadImagenes()
        {
            GridView1.DataSource = ArchivosDAL.GetAll();
            GridView1.DataBind();
        }

        protected void trvFacultad_SelectedNodeChanged(object sender, EventArgs e)
        {
            Label1.Visible = true;
            Label1.Text = trvFacultad.SelectedNode.Text;
            MultiView1.SetActiveView(View1);
            lt.ConsultarImagenes(Label1.Text, Repeater1);
        }

       
        
    }
}