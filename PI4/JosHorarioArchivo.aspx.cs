using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PI4
{
    public partial class JosHorarioArchivo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarListadImagenes();
        }
        private void CargarListadImagenes()
        {
            GridView1.DataSource = ArchivosDAL.GetAll();
            GridView1.DataBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (FileUpload4.HasFile)
            {
                using (BinaryReader reader = new BinaryReader(FileUpload4.PostedFile.InputStream))
                {
                    byte[] image = reader.ReadBytes(FileUpload4.PostedFile.ContentLength);

                    ArchivosDAL.Guardar(cmbComboCarrera0.SelectedValue, cmbComboAnioLectivo0.SelectedValue, FileUpload4.FileName, image.Length, image);
                    //Label7.Text = image.Length.ToString();
                    String msj = "Archivo guardado correctamente.";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + msj + "');</script>");
                }
                CargarListadImagenes();
            }
        }
    }
}