using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;
using System.Data.OleDb;
using System.Xml.Linq;
using LinqToExcel;
using System.IO;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace PI4
{
    public partial class Materia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View3);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Visible = false;
            bool bandera = true;
            string filename = "";
            if (FileUpload1.HasFile)
            {
                string fileExt =
                   System.IO.Path.GetExtension(FileUpload1.FileName);

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
                //Microsoft.ACE.OLEDB.12.0 string ruta=Microsoft.Jet.OleDb.4.0 = System.IO.Path.GetFullPath(FileUpload1.PostedFile.FileName);
                string sConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + filename+ ";" + "Extended Properties=Excel 8.0;";
                string sqlExcel = "Select * From Sistemas";
                DataSet DS = new DataSet();
                OleDbConnection oledbConn = new OleDbConnection(sConnectionString);
                oledbConn.Open();
                OleDbCommand oledbCmd = new OleDbCommand(sqlExcel, oledbConn);
                OleDbDataAdapter da = new OleDbDataAdapter(oledbCmd);
                da.Fill(DS);
                GridView1.DataSource = DS;
                GridView1.DataBind();
                oledbConn.Close();
                btnMateria.Visible = true;
            }
            MultiView1.SetActiveView(View1);

            //Segunda forma


            //String ruta="C:\\Users\\BM\\Desktop\\Maya Curricular.xlsx";
            //var book = new ExcelQueryFactory(ruta);
            //var res = from row in book.Worksheet("Hoja1")
            //          select row;
            //var columnNames = book.GetColumnNames("Hoja1");
            //DataTable dtExcelRecords = new DataTable();
            //foreach (var columnName in columnNames)
            //{
            //       dtExcelRecords.Columns.Add(columnName); 
            //}
            //foreach (var row in res)
            //{
            //    DataRow dr = dtExcelRecords.NewRow();
            //    foreach (var columnName in columnNames) 
            //    {
                    
            //        dr[columnName] = row[columnName]; 
            //    }
                
            //    dtExcelRecords.Rows.Add(dr);
            //}
            //GridView1.DataSource = dtExcelRecords;
            //GridView1.DataBind();
           
    
    
    //if (ExlSheet.HasFile) { string fileName = Path.GetFileName(ExlSheet.PostedFile.FileName); 
    //            string fileExtension = Path.GetExtension(ExlSheet.PostedFile.FileName); 
    //            string fileLocation = Server.MapPath("~/App_Data/" + fileName); ExlSheet.SaveAs(fileLocation);
    //            ExcelQueryFactory excelFile = new ExcelQueryFactory(fileLocation); 
    //            var data = from a in excelFile.Worksheet("Sheet1") select a;
    //            var columnNames = excelFile.GetColumnNames("Sheet1");
    //            DataTable dtExcelRecords = new DataTable(); 
    //            foreach (var columnName in columnNames) { dtExcelRecords.Columns.Add(columnName); }
    //            foreach (var row in data) { DataRow dr = dtExcelRecords.NewRow(); 
    //                foreach (var columnName in columnNames) { dr[columnName] = row[columnName]; } 
    //                dtExcelRecords.Rows.Add(dr); } gv.DataSource = dtExcelRecords; gv.DataBind(); }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
        }

        protected void FileUpload1_Load(object sender, EventArgs e)
        {
          
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View1);
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View2);
        }

        protected void btnMateria_Click(object sender, EventArgs e)
        {
            //for (int i = 0; i < GridView1.Columns.Count; i++)
            //{
            //    foreach (GridViewRow fila in GridView1.Rows)
            //    {
            //        string valorcol2 = fila.Cells[i].Text;
            //        string Columna = GridView1.HeaderRow.Cells[i].Text;

            //    }    
            //}
            String Xml="'<xml>";
            int Carrera = int.Parse(DropDownList1.SelectedItem.Value);
            for (int fila = 0; fila < GridView1.Rows.Count - 1; fila++)
            {
                for (int col = 0; col < GridView1.Rows[fila].Cells.Count; col++)
                {
                    string valor = GridView1.Rows[fila].Cells[col].Text;
                    string Columna = GridView1.HeaderRow.Cells[col].Text;
                    if (valor.Equals("&nbsp;") || valor.Equals("&nbsp"))
                    {

                    }
                    else
                    {
                        int header = 0;
                        switch (Columna.Trim())
                        {
                            case "Primer Semestre":
                                header = 1;
                                break;
                            case "Segundo Semestre":
                                header = 2;
                                break;
                            case "Tercer Semestre":
                                header = 3;
                                break;
                            case "Cuarto Semestre":
                                header = 4;
                                break;
                            case "Quinto Semestre":
                                header = 5;
                                break;
                            case "Sexto Semestre":
                                header = 6;
                                break;
                            case "Septimo Semestre":
                                header = 7;
                                break;
                            case "Octavo Semestre":
                                header = 8;
                                break;
                            case "Noveno Semestre":
                                header = 9;
                                break;
                            case "Decimo Semestre":
                                header = 10;
                                break;
                        }
                        Xml = Xml + "<Materias>" +
                        "<MATERIA>" + valor.Trim() + "</MATERIA>" +
                        "<CARRERA>" + Carrera + "</CARRERA>" +
                        "<MODULO>" + header + "</MODULO>" +
                        "</Materias>";
                    }
                }
            }
            Xml = Xml + "</xml>'";
            Negocio neg = new Negocio();
            String msm=neg.InsertarMaterias(Xml);
            MessageBox.Show(msm);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int Carrera=int.Parse(DropDownListCarrera.SelectedItem.Value);
            int Semestre = int.Parse(DropDownListSemestre.SelectedItem.Value);
            String Xml = "'<xml>";
            Xml = Xml + "<Materias>" +
                        "<MATERIA>" + textMateria.Text.Trim() + "</MATERIA>" +
                        "<CARRERA>" + Carrera + "</CARRERA>" +
                        "<MODULO>" + Semestre + "</MODULO>" +
                        "</Materias>";
            Xml = Xml + "</xml>'";
            Negocio neg = new Negocio();
            String msm = neg.InsertarMaterias(Xml);
            MessageBox.Show(msm);
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View3);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }
    }
}