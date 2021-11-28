using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;


namespace PI4
{
    public class Conexion
    {
        SqlConnection conectar = new SqlConnection("Data Source=BRYAN\\SQLEXPRESS;Initial Catalog=BDPI4;Persist Security Info=True;User ID=Administracion;Password=programacion");
       public static SqlConnection conectar1 = new SqlConnection("Data Source=BRYAN\\SQLEXPRESS;Initial Catalog=BDPI4;Persist Security Info=True;User ID=Administracion;Password=programacion");
        public SqlConnection Conectar()
        {
            conectar = new SqlConnection("Data Source=BRYAN\\SQLEXPRESS;Initial Catalog=BDPI4;Persist Security Info=True;User ID=Administracion;Password=programacion");
            conectar.Open();
            return conectar;
        }
        public void cerrar()
        {
            if (conectar.State == ConnectionState.Open)
                conectar.Close();
        }
        public SqlCommand Ejecutar(SqlCommand com)
        {
            conectar = new SqlConnection("Data Source=BRYAN\\SQLEXPRESS;Initial Catalog=BDPI4;Persist Security Info=True;User ID=Administracion;Password=programacion");
            if (conectar.State == ConnectionState.Closed)
            {
                conectar.Close();
                conectar.Open();
                com.Connection = conectar;
                com.ExecuteNonQuery();
                conectar.Close();
            }
            return com;
        }
        public DataTable CargarDataSource(string query)
        {
            DataTable dt = new DataTable();

            using (conectar)
            {
                SqlCommand cmd = new SqlCommand(query, conectar);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            return dt;
        }
        public void InsertarFacultad(string nom_archivo)
        {

            try
            {
                conectar.Open();
                if (conectar.State != ConnectionState.Closed)
                {

                    string query = " exec spINSFacultad @nombre";



                    SqlCommand cmd = new SqlCommand(query, conectar);

                    cmd.Parameters.AddWithValue("@nombre ", nom_archivo);




                    cmd.ExecuteNonQuery();
                    conectar.Close();
                }
            }
            catch (SqlException ex)
            {

            }
        }
        public void Guardar(string ID, string nom_archivo, byte[] archivo)
        {

            try
            {
                conectar.Open();
                if (conectar.State != ConnectionState.Closed)
                {

                    string query = " exec spINSCarrera @Nombre , @idFacul , @Malla   ";



                    SqlCommand cmd = new SqlCommand(query, conectar);

                    cmd.Parameters.AddWithValue("@Nombre ", nom_archivo);
                    cmd.Parameters.AddWithValue("@idFacul", ID);
                    cmd.Parameters.AddWithValue("@Malla", SqlDbType.VarBinary).Value = archivo;

                    cmd.ExecuteNonQuery();
                    conectar.Close();
                }
            }
            catch (SqlException ex)
            {

            }
        }
    }
}