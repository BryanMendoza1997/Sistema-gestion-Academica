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
    public partial class RecuperacionPass : System.Web.UI.Page
    {
        Conexion con = new Conexion();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (validadorDeCedula((TextBox1.Text.Trim().ToCharArray())))
            {
                string cedu = TextBox1.Text;
                string correo = TextBox2.Text;
                string contra;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "RecuperarPassword";
                cmd.Connection = con.Conectar();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Correo", SqlDbType.Char, 25).Value = correo;
                cmd.Parameters.Add("@Cedula", SqlDbType.Char, 15).Value = cedu;
                cmd.Parameters.Add("@Contrasenia", SqlDbType.VarChar, -1).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();

                TextBox3.Text = cmd.Parameters["@Contrasenia"].Value.ToString();
                contra = cmd.Parameters["@Contrasenia"].Value.ToString();
                con.cerrar();
                if (TextBox3.Text == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + "ERROR USUARIO O CORREO INCORRECTO" + "');</script>");﻿
            }
                else
                {
                    CCorreo objcorreo = new CCorreo(correo, "Recuperacion de Contraseña", "Su contraseña es: " + contra);
                    if (objcorreo.Estado)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + "Se envio el correo exiosamente" + "');</script>");﻿
                }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + "Error al enviar el correo verifique... <br>" + objcorreo.mensaje_error + "');</script>");﻿
                }
                }
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + "Error en numero de cedula" + "');</script>");﻿
            }
        }
        public static bool VerificacionCdedula(string ced)
        {
            int isNumeric;
            var total = 0;
            const int tamanoLongitudCedula = 10;
            int[] coeficientes = { 2, 1, 2, 1, 2, 1, 2, 1, 2 };
            const int numeroProvincias = 24;
            const int tercerDigito = 6;

            if (int.TryParse(ced, out isNumeric) && ced.Length == tamanoLongitudCedula)
            {
                var provincia = Convert.ToInt32(string.Concat(ced[0], ced[1], string.Empty));
                var digitoTres = Convert.ToInt32(ced[2] + string.Empty);
                if ((provincia > 0 && provincia <= numeroProvincias) && digitoTres < tercerDigito)
                {
                    var digitoVerificadorRecibido = Convert.ToInt32(ced[9] + string.Empty);
                    for (int k = 0; k < coeficientes.Length; k++)
                    {
                        var valor = Convert.ToInt32(coeficientes[k] + string.Empty) *
                        Convert.ToInt32(ced[k] + string.Empty);
                        total = valor > 10 ? total + (valor - 9) : total + valor;
                    }
                    var digitoVerificadorObtenido = total >= 10 ? (total % 10) != 0 ?
                    10 - (total % 10) : (total % 10) : total;
                    return digitoVerificadorObtenido == digitoVerificadorRecibido;
                }
                return false;
            }
            return false;
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
    }
}