using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
 using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Text;

namespace PI4
{
    public partial class AgregarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void rdbDocente_CheckedChanged(object sender, EventArgs e)
        {
           
            
            
        }

        protected void rdbEstudiante_CheckedChanged(object sender, EventArgs e)
        {
            
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
        protected void btnSiguientePersonal_Click(object sender, EventArgs e)
        {
            int next = 0;
            int a = 0;
            if (validadorDeCedula((txtCedula.Text.Trim().ToCharArray())))
                next = 1;
            else
            {
                next = 0;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('El número de cédula es inválido.');", true);

            }
            if (email_bien_escrito(txtCorreo.Text.Trim()) && next == 1)
            {
                next = 2;
            }
            else
            {
                next = 0;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('El correo es inválido.');", true);
            }

            if (next == 1)
            {
                try
                {
                    Conexion oad = new Conexion();
                    SqlCommand com = new SqlCommand("select count(*) from TB_PERSONA WHERE CEDULA=  @cedula ");
                    com.Connection = oad.Conectar();
                    com.Parameters.AddWithValue("@cedula", txtCedula.Text.Trim());

                    a = (Int32)com.ExecuteScalar();


                    if (a > 0)
                    {
                        next = 0;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('El número de cédula ya está registrado.');", true);
                    }
                }
                catch (SqlException ex)
                {

                }
            }
            if (next == 2)
            {
                MultiView1.SetActiveView(View2);
            }

        }
        private Boolean email_bien_escrito(String email)
        {
            String expresion;
            expresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
            if (Regex.IsMatch(email, expresion))
            {
                if (Regex.Replace(email, expresion, String.Empty).Length == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        public bool VerificaCedula(string cedula)
        {
            int isNumeric;
            var total = 0;
            const int tamanolongitud = 10;
            int[] coeficientes = { 2, 1, 2, 1, 2, 1, 2, 1, 2 };
            const int numeroProvincias = 24;
            const int tercerDigito = 6;
            if (int.TryParse(cedula,out isNumeric)&& cedula.Length==tamanolongitud)
            {
                var provincia = Convert.ToInt32(string.Concat(cedula[0], cedula[1], string.Empty));
                var digitoTres = Convert.ToInt32(cedula[2] + string.Empty);
                if ((provincia>0 && provincia <=numeroProvincias)&&digitoTres<tercerDigito)
                {
                    var digitoVerficadorRecibido = Convert.ToInt32(cedula[9] + string.Empty);
                    for (var k = 0; k < coeficientes.Length; k++)
                    {
                        var valor = Convert.ToInt32(coeficientes[k] + string.Empty)*Convert.ToInt32(cedula[k]+string.Empty);
                        total = valor >= 10 ? total + (valor - 9) : total + valor;
                        
                    }
                    var digitoVerificadorObtenido = total >= 10 ? (total % 10) != 0 ? 10 - (total % 10) : (total % 10) : total;
                    return digitoVerificadorObtenido ==digitoVerficadorRecibido;
                }
                return false;

            }
            return false;
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
           
            try
            {
                SqlCommand com = new SqlCommand("EXECUTE spIngresarPersona @nombres,@apellidos,@cedula,@celular,@correo,@carrera ");

                com.Parameters.AddWithValue("@nombres", txtNombres.Text);
                com.Parameters.AddWithValue("@apellidos", (txtApellidos.Text));
                com.Parameters.AddWithValue("@cedula", txtCedula.Text);
                com.Parameters.AddWithValue("@celular", (txtTelefono.Text));
                com.Parameters.AddWithValue("@correo", (txtCorreo.Text));
                com.Parameters.AddWithValue("@carrera", (int.Parse(DropDownList2.SelectedValue.ToString())));
                 

                Conexion oad = new Conexion();
                oad.Ejecutar(com);

                txtCedula.Text = "";
                txtNombres.Text = "";
                txtApellidos.Text = "";
                txtTelefono.Text = "";

                txtCorreo.Text = "";


            }
            catch (SqlException ex)
            {
                Label16.Text= ex.Message.ToString();
            }
            MultiView1.SetActiveView(View4);
            Response.Redirect("loguin.aspx");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View1);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View2);
        }
        public static string CifrarSHA1(string ContraseñaOr)
        {
        SHA1 sha1 = new SHA1CryptoServiceProvider();

        byte[] inputBytes = (new UnicodeEncoding()).GetBytes(ContraseñaOr);
        byte[] hash = sha1.ComputeHash(inputBytes);

        return Convert.ToBase64String(hash);
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
           
           
        }

        protected void txtCedula_TextChanged(object sender, EventArgs e)
        {

        }
    }
}