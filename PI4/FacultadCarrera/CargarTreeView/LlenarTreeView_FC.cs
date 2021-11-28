using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace ProyectoIntegrador.FacultadCarrera.CargarTreeView
{
    public class LlenarTreeView_FC
    {
       public   void LlenarTreeView(TreeView TreeView1)
        {
            DataSet PrSet = PDataset("SELECT * FROM TB_FACULTAD");
            //DataSet PrSet = d.DevuelveRegistro("SELECT *FROM TB_FACULTAD");
            TreeView1.Nodes.Clear();

            foreach (DataRow dr in PrSet.Tables[0].Rows)
            {

                TreeNode tnParent = new TreeNode();

                tnParent.Text = dr["Nombre"].ToString();

                tnParent.Value = dr["ID_facultad"].ToString();

                tnParent.PopulateOnDemand = true;

                tnParent.ToolTip = "Click to get Child";

                tnParent.SelectAction = TreeNodeSelectAction.SelectExpand;

                tnParent.Expand();

                tnParent.Selected = true;

                TreeView1.Nodes.Add(tnParent);

                FillChild(tnParent, tnParent.Value);
                //ConsultaImagen();

            }
        }
         void FillChild(TreeNode parent, string ParentId)
        {

            DataSet ds = PDataset("Select * from TB_CARRERA where ID_FACULTAD =" + ParentId);

            parent.ChildNodes.Clear();

            foreach (DataRow dr in ds.Tables[0].Rows)
            {

                TreeNode child = new TreeNode();

                child.Text = dr["Nombre"].ToString().Trim();

                child.Value = dr["ID_Carrera"].ToString().Trim();

                if (child.ChildNodes.Count == 0)
                {

                    child.PopulateOnDemand = true;

                }

                child.ToolTip = "Click to get Child";

                child.SelectAction = TreeNodeSelectAction.SelectExpand;

                child.CollapseAll();

                parent.ChildNodes.Add(child);

            }

        }


        protected DataSet PDataset(string Select_Statement)
        {

            SqlConnection SqlCon = new SqlConnection("Data Source=JOSELYNV\\SQLSERVER;Initial Catalog=BDPI4;Integrated Security=True");


            SqlDataAdapter ad = new SqlDataAdapter(Select_Statement, SqlCon);

            DataSet ds = new DataSet();

            ad.Fill(ds);

            return ds;



        }

        public void ConsultarImagenes(String imagen, Repeater Repeater1)
        {
            
            SqlConnection con = new SqlConnection("Data Source=JOSELYNV\\SQLSERVER;Initial Catalog=BDPI4;Integrated Security=True");
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "exec spSEL_MostrarMalla '" + imagen + "'";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            
            DataTable Imagen = new DataTable();
            Imagen.Load(cmd.ExecuteReader());

            
                Repeater1.DataSource = Imagen;
                Repeater1.DataBind();
          





            con.Close();
            
        }
    }
}