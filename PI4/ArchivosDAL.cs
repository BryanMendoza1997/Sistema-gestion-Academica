using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Configuration;

namespace PI4
{
    public static class ArchivosDAL
    {
         
        public static void Guardar(String ID, String ID_Periodo, string nombrearchivo, int length, byte[] archivo)
        {
            Conexion conn = new Conexion();

                string query = @"insert into TB_HORARIO_CARRERA (ID_PERIODO,ID_CARRERA,NOMBRE_HORARIO,TAMAÑO,CONTENIDO)
                                values(@periodo_id,@id,@nombre, @tamanio, @contenido)";

                SqlCommand cmd = new SqlCommand(query, conn.Conectar());

                cmd.Parameters.AddWithValue("@periodo_id", ID_Periodo);
                cmd.Parameters.AddWithValue("@id", ID);
                cmd.Parameters.AddWithValue("@nombre", nombrearchivo);
                cmd.Parameters.AddWithValue("@tamanio", length);

                SqlParameter archParam = cmd.Parameters.Add("@contenido", System.Data.SqlDbType.VarBinary);
                archParam.Value = archivo;

                cmd.ExecuteNonQuery();

           

        }

        public static List<Archivo> GetAll()
        {
            Conexion con = new Conexion();
            List<Archivo> lista = new List<Archivo>();

             
                con.Conectar();

                string query = @"select ID,NOMBRE_HORARIO,TAMAÑO from TB_HORARIO_CARRERA";

                SqlCommand cmd = new SqlCommand(query, con.Conectar());

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Archivo img = new Archivo(
                                            Convert.ToInt32(reader["ID"]),
                                            Convert.ToString(reader["NOMBRE_HORARIO"]),
                                            Convert.ToInt32(reader["TAMAÑO"]));
                    lista.Add(img);
                }

           

            return lista;

        }

        public static Archivo GetById(int Id)
        {
            Archivo arch = null;


            Conexion con = new Conexion();

                string query = @"select ID,NOMBRE_HORARIO,TAMAÑO,contenido from TB_HORARIO_CARRERA where id= @id";

                SqlCommand cmd = new SqlCommand(query, con.Conectar());
                cmd.Parameters.AddWithValue("@id", Id);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    arch =  new Archivo(
                                            Convert.ToInt32(reader["ID"]),
                                            Convert.ToString(reader["NOMBRE_HORARIO"]),
                                            Convert.ToInt32(reader["TAMAÑO"]));

                    arch.ContenidoArchivo = (byte[])reader["contenido"];

                }

          

            return arch;

        }

        public static void DeleteById(int Id)
        {

            using (SqlConnection conectar = new SqlConnection("Data Source=BRYAN\\SQLEXPRESS;Initial Catalog=BDPI4;Persist Security Info=True;User ID=Administracion;Password=programacion"))
            {
                conectar.Open();

                string query = @"DELETE FROM Archivos WHERE Id = @id";

                SqlCommand cmd = new SqlCommand(query, conectar);
                cmd.Parameters.AddWithValue("@id", Id);

                cmd.ExecuteNonQuery();

            }
        }


    }

    public class Archivo
    {
        public Archivo(int id, string nombre, int length)
        {
            this.Id = id;
            this.Nombre = nombre;
            this.Length = length;
        }
        public int Id { get; set; }
        public int Length { get; set; }
        public string Nombre { get; set; }

        public byte[] ContenidoArchivo { get; set; }
    }

}
