using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PI4
{
    public partial class Carrera : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label11.Visible = false;
            Label7.Visible = false;
        }

        protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
        {

        }

        Conexion hola = new Conexion();
        protected void Button1_Click(object sender, EventArgs e)
        {
            byte[] ima = new byte[x.Length];

            for (int i = 0; i < x.Length; i++)
            {
                ima[i] = Convert.ToByte(x.Substring(i, 1));
            }
            if (image != null)
            {
                hola.Guardar(DropDownList1.SelectedValue, TextBox1.Text, ima);
                Label7.ForeColor = Color.Black;
                Label7.Text = "Guardado exitosamente.";

            }
            else
            {
                Label7.Visible = true;
                Label7.Text = "No hay nada";
            }

        }
        public System.Drawing.Image RedireccionarImagen(System.Drawing.Image Imagen, int alto)
        {
            double radio = Convert.ToDouble(alto) / Convert.ToDouble(Imagen.Height);
            int Ancho = Convert.ToInt16(Imagen.Width) * Convert.ToInt16(radio);
            int NuevoAlto = (int)(Convert.ToInt16(Imagen.Height) * radio);
            System.Drawing.Image NuevaImagen = new Bitmap(Ancho, NuevoAlto);
            Graphics g = Graphics.FromImage(NuevaImagen);
            g.DrawImage(Imagen, 0, 0, Ancho, NuevoAlto);
            return NuevaImagen;

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        public byte[] image = null;
        string x = "";
        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                using (BinaryReader reader = new BinaryReader(FileUploadMalla.PostedFile.InputStream))
                {
                    int tamIMG = FileUploadMalla.PostedFile.ContentLength;
                    byte[] ImagenOriginal = new byte[tamIMG];


                    FileUploadMalla.PostedFile.InputStream.Read(ImagenOriginal, 0, tamIMG);

                    Label7.Text = tamIMG.ToString();

                    Label7.Text = ImagenOriginal.Length.ToString();

                    Label7.Text = DropDownList1.SelectedValue.ToString();
                    hola.Guardar(DropDownList1.SelectedValue.ToString(), TextBox1.Text, ImagenOriginal);

                }
            }
            catch (Exception ex) { 

            }

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedValue.ToString() == "1")
            {
                MultiView1.SetActiveView(View1);
            }
            else if(DropDownList2.SelectedValue.ToString() == "2")
                MultiView1.SetActiveView(View2);
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                hola.InsertarFacultad(TextBox2.Text);
                //Label11.Visible = true;
                //Label11.ForeColor = Color.Black;               
                 
                //Label11.Text = "Guardado exitosamente.";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + "Guardado exitosamente." + "');</script>");
            }
            catch (Exception ex)
            {
                Label11.Visible = true;
                Label11.ForeColor = Color.Red;
                //Label11.Text = "Ha ocurrido un error durante la inserción.";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + "Ha ocurrido un error durante la inserción." + "');</script>");
            }


        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {
                using (BinaryReader reader = new BinaryReader(FileUploadMalla.PostedFile.InputStream))
                {
                    int tamIMG = FileUploadMalla.PostedFile.ContentLength;
                    byte[] ImagenOriginal = new byte[tamIMG];


                    FileUploadMalla.PostedFile.InputStream.Read(ImagenOriginal, 0, tamIMG);

                    Label7.Text = tamIMG.ToString();

                    Label7.Text = ImagenOriginal.Length.ToString();

                    Label7.Text = DropDownList1.SelectedValue.ToString();
                    hola.Guardar(DropDownList1.SelectedValue.ToString(), TextBox1.Text, ImagenOriginal);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + "Carrera ingresada correcamente." + "');</script>");
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + "Ha ocurrido un error durante la inserción." + "');</script>");
            }

        }
    }
}