using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace PI4
{
    public class Negocio
    {
         public string InsertarMaterias (String xml)
        {
             Conexion con = new Conexion();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "InsertarMaterias";
            cmd.Connection = con.Conectar();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@xml", SqlDbType.VarChar,-1).Value = xml;
            cmd.Parameters.Add("@Mensaje", SqlDbType.VarChar,-1).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            string msm =(string) cmd.Parameters["@Mensaje"].Value;
            return msm;
        }
    }
}