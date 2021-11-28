using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LinqToExcel;
using System.IO;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;
using System.Xml;
using System.Data.OleDb;
using System.Xml.Linq;

namespace PI4
{
    public partial class Horarios : System.Web.UI.Page
    {
        Conexion con = new Conexion();
        public string filename="";
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            FileUpload objFileUpload = new FileUpload();
            objFileUpload = (FileUpload)Session["contiene_FileUpload1"];
            Label1.Visible = false;
            string Hoja = DropDownList5.SelectedValue.Trim();
            bool bandera = true;
            filename = "";
            if (objFileUpload.HasFile)
            {
                //string fileExt = System.IO.Path.GetExtension(Label10.Text);

                //if (fileExt == ".xlsx" || fileExt == ".xls")
                //{
                    try
                    {
                        filename = Path.Combine(Path.GetTempPath(), Path.ChangeExtension(Guid.NewGuid().ToString(), ".xlsx"));
                        File.WriteAllBytes(filename, objFileUpload.FileBytes);
                    }
                    catch (Exception ex)
                    {
                        Label1.Text = "ERROR: " + ex.Message.ToString();
                        bandera = false;
                    }
                //}
                //else
                //{
                //    Label1.Text = "Solo se admiten archivos .xlsx !";
                //    bandera = false;
                //    Label1.Visible = true;
                //}
            }
            else
            {
                Label1.Text = "Seleccione un archivo exel";
                bandera = false;
                Label1.Visible = true;
            }
            if (bandera)
            {
                try
                {
                    //Microsoft.ACE.OLEDB.12.0 string ruta=Microsoft.Jet.OleDb.4.0 = System.IO.Path.GetFullPath(FileUpload1.PostedFile.FileName);
                    string sConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + filename + ";" + "Extended Properties=Excel 8.0;";
                    string sqlExcel = "Select * From "+Hoja+"";
                    DataSet DS = new DataSet();
                    OleDbConnection oledbConn = new OleDbConnection(sConnectionString);
                    oledbConn.Open();
                    OleDbCommand oledbCmd = new OleDbCommand(sqlExcel, oledbConn);
                    OleDbDataAdapter da = new OleDbDataAdapter(oledbCmd);
                    da.Fill(DS);
                    GridView1.DataSource = DS;
                    GridView1.DataBind();
                    oledbConn.Close();
                    MultiView1.SetActiveView(View1);
                    btnvisualizarmaterias.Visible = true;
                    GridView2.DataBind();
                    btnguardarhorario.Visible = false;
                    
                }
                catch
                {
                    Label1.Text = "Error al intentar leer la Hoja: "+Hoja;
                    Label1.Visible = true;
                }
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            //consultar año

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "OBTENERPERIODO";
            cmd.Connection = con.Conectar();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FECHA", SqlDbType.NVarChar,-1).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            String  Fecha = cmd.Parameters["@FECHA"].Value.ToString();
            Periodo.Text = Fecha;
            con.cerrar();
            MultiView1.SetActiveView(View1);
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            List<string> lista = new List<string>();
            for (int fila = 1; fila < GridView1.Rows.Count - 1; fila++)
            {
                for (int col = 1; col < GridView1.Rows[fila].Cells.Count; col++)
                {
                    string valor =GridView1.Rows[fila].Cells[col].Text;
                    string Columna = GridView1.HeaderRow.Cells[col].Text;
                    if (valor.Equals("&nbsp;") || valor.Equals("&nbsp") || valor.Substring(0,2).ToString().Equals("T_"))
                    {

                    }
                    else
                    {
                        valor = Page.Server.HtmlDecode(valor); 
                        bool ban;
                        ban = true;
                        foreach (var item in lista)
                        {
                            if (item.Trim().Equals(valor.Trim()))
                            {
                                ban = false;
                            }
                        }
                        if (ban)
                        {
                            lista.Add(valor);
                        }

                    }
                }


            }
            
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText="SELECT RTRIM(TB_PERSONA.NOMBRES)+' '+LTRIM(TB_PERSONA.APELLIDOS) FROM TB_PERSONA INNER JOIN TB_DOCENTE ON TB_PERSONA.ID_PERSONA=TB_DOCENTE.ID_PERSONA";
            cmd.Connection = con.Conectar();
            DropDownList combo= new DropDownList();
            combo.DataSource=cmd.ExecuteReader();
            DataTable TABLE = new DataTable();
            TABLE.Columns.Add("Materias");
            foreach (var item in lista)
            {
                TABLE.Rows.Add(item);
                
            }
            GridView2.DataSource=TABLE;
            GridView2.DataBind();
            MultiView1.SetActiveView(View1);
            btnguardarhorario.Visible = true;
            con.cerrar();
           
        }

        protected void btnguardarhorario_Click(object sender, EventArgs e)
        {

//</XML>'
            //ARMANDO CABECERA
           
            int Carrera = int.Parse(DropDownList1.SelectedItem.Value);
            int Semestre = int.Parse(DropDownList2.SelectedItem.Value);
            string Paralelo = DropDownList3.SelectedItem.Value;
            int periodo = int.Parse(DropDownList4.SelectedItem.Value);
            switch (Paralelo)
            {
                case "1": Paralelo = "A"; break;
                case "2": Paralelo = "B"; break;
                case "3": Paralelo = "C"; break;
                case "4": Paralelo = "D"; break;
                case "5": Paralelo = "E"; break;
                case "6": Paralelo = "F"; break;
                case "7": Paralelo = "G"; break;
                case "8": Paralelo = "H"; break;
                case "9": Paralelo = "I"; break;
                case "10": Paralelo = "J"; break;
                case "11": Paralelo = "K"; break;
                case "12": Paralelo = "R"; break;
            }
            string Xml = "'<XML>" +
           "<ENCABEZADO>" +
           "<CARRERA>"+Carrera+"</CARRERA>" +
           "<SEMESTRE>"+Semestre+"</SEMESTRE>" +
          "<PARALELO>"+Paralelo+"</PARALELO>" +
           "<PERIODO>"+periodo+"</PERIODO>" +
           "</ENCABEZADO>";


            //ARMANDO DOCENTES

         


            for (int fila = 0; fila < GridView2.Rows.Count; fila++)
            {
                for (int col = 1; col < GridView2.Rows[fila].Cells.Count; col++)
                {
                    string valor = GridView2.Rows[fila].Cells[col].Text;
                    int docente = int.Parse(((DropDownList)GridView2.Rows[fila].Cells[0].FindControl("DropUsado")).SelectedValue);
                    string Columna = GridView2.HeaderRow.Cells[col].Text;
                    if (valor.Equals("&nbsp;") || valor.Equals("&nbsp"))
                    {

                    }
                    else
                    {
                        Xml = Xml + "<DOCENTES>" +
                        "<ID>"+docente+"</ID>" +
                        "<MATERIA>"+valor+"</MATERIA>" +
                       "</DOCENTES>";
                    }
                }
            }
            //ARMANDO MATERIAS
            String Hora = "";
            for (int fila = 0; fila < GridView1.Rows.Count; fila++)
            {
                for (int col = 0; col < GridView1.Rows[fila].Cells.Count; col++)
                {
                    string valor = GridView1.Rows[fila].Cells[col].Text;
                    string Columna = GridView1.HeaderRow.Cells[col].Text;
                    if (valor.Substring(0, 2).ToString().Equals("T_"))
                    {
                        valor = valor.Replace("T_","");
                    }
                    if (valor.Equals("&nbsp;") || valor.Equals("&nbsp"))
                    {

                    }
                    else
                    {
                        if (col == 0)
                        {
                            Hora = GridView1.Rows[fila].Cells[col].Text;
                        }
                        else
                        {
                            Xml = Xml + "<MATERIAS>" +
                            "<HORA>" + Hora + "</HORA>" +
                            "<DIA>" + Columna + "</DIA>" +
                            "<MATERIA>" + valor + "</MATERIA>" +
                            "</MATERIAS>";
                        }
                    }
                }
            }

            Xml = Xml + "</XML>'";
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con.Conectar();
            cmd.CommandText = ("INSERTARHORARIO");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@XML", Xml));
            SqlParameter Mensajes = new SqlParameter("@Mensaje",SqlDbType.NVarChar,-1);
            Mensajes.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(Mensajes);
            cmd.ExecuteNonQuery();
            string msj = cmd.Parameters["@Mensaje"].Value.ToString();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + msj + "');</script>");﻿
            GridView1.DataBind();
            GridView2.DataBind();
            btnvisualizarmaterias.Visible = false;
            btnguardarhorario.Visible = false;
            con.cerrar();
            
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click2(object sender, EventArgs e)
        {
          
        }

        protected void FileUpload1_DataBinding(object sender, EventArgs e)
        {
         
        }

        protected void FileUpload1_Init(object sender, EventArgs e)
        {
          
        }

        protected void Button1_Click3(object sender, EventArgs e)
        {
          Boolean bandera = true;
          Label1.Visible = false;
          filename = "";
            if (FileUpload1.HasFile)
            {
                Session["contiene_FileUpload1"] = FileUpload1;
                Label10.Text = FileUpload1.FileName;
                string fileExt = System.IO.Path.GetExtension(FileUpload1.FileName);
                if (fileExt == ".xlsx" || fileExt == ".xls")
                {
                    try
                    {
                        filename = Path.Combine(Path.GetTempPath(), Path.ChangeExtension(Guid.NewGuid().ToString(), ".xlsx")); File.WriteAllBytes(filename, FileUpload1.FileBytes);
                    }
                    catch (Exception ex)
                    {
                        Label1.Text = "ERROR: " + ex.Message.ToString();
                        bandera = false;
                    }
                }
                else
                {
                    Label1.Text = "Solo se admiten archivos .xlsx !";
                    bandera = false;
                    Label1.Visible = true;
                }
             }
             else
             {
                Label1.Text = "Seleccione un archivo exel";
                bandera = false;
                Label1.Visible = true;
             }
                if (bandera)
                {
                    FileUpload1.Visible = false;
                    Label10.Visible = true;
                    Label5.Visible = false;
                    try{
                    System.Data.DataTable dt = null;
                    string conectar = "Provider=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + filename + ";" + "Extended Properties=Excel 8.0;";
                    OleDbConnection oledbConn = new OleDbConnection(conectar);
                    oledbConn.Open();
                    dt = oledbConn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                    String[] excelSheets = new String[dt.Rows.Count];
                    int i = 0;
                    foreach (DataRow row in dt.Rows)
                    {
                        excelSheets[i] = row["TABLE_NAME"].ToString();

                        i++;
                    }
                    string caracter;
                    for (int j = 0; j < excelSheets.Count(); j++)
                    {
                        caracter = excelSheets[j].Substring(excelSheets[j].Length - 1, 1);
                        if (caracter.Equals("$"))
                        {

                        }
                        else
                        {
                            DropDownList5.Items.Add(excelSheets[j].Trim());
                        }
                    }
                    oledbConn.Close();
                    Button1.Visible = false;
                    Button2.Visible = true;
                    btnvisualizarhorario.Visible = true;
                    }
                     catch (Exception )
                     {
                         Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Error al leer el archivo');</script>");﻿
                     }
                
            }
           
        }
        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
            GridView2.DataBind();
            btnguardarhorario.Visible = false;
            btnvisualizarmaterias.Visible = false;
        }

        protected void DropDownList5_DataBinding(object sender, EventArgs e)
        {

        }

        protected void Button2_Click2(object sender, ImageClickEventArgs e)
        {
            FileUpload1.Visible = true;
            Label10.Visible = false;
            Button1.Visible = true;
            DropDownList5.Items.Clear();
            Session.Clear();
            Button2.Visible = false;
            GridView1.DataSource = null;
            GridView2.DataSource = null;
            GridView1.DataBind();
            GridView2.DataBind();
            btnvisualizarmaterias.Visible = false;
            btnvisualizarhorario.Visible = false;
            Label5.Visible = true;
            btnguardarhorario.Visible = false;
        }
    }
}