using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace projectecom
{
    public class Class1
    {
        SqlConnection con;
        SqlCommand cmd;
        public Class1()
        {
            con = new SqlConnection(@"server=LAPTOP-LGM6III9\SQLEXPRESS;database=Ecom;Integrated security=true");
        }
        public int fn_nonquery(string s)
        {
            if(con.State==ConnectionState.Open)
            {
                con.Close();
            }
            cmd = new SqlCommand(s, con);
            con.Open();
            int n = cmd.ExecuteNonQuery();
            return n;
        }
        public string fn_scalar(string s)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            cmd = new SqlCommand(s, con);
        con.Open();
        string sl = cmd.ExecuteScalar().ToString();
        con.Close();
            return sl;
        }
        public SqlDataReader fn_reader(string s)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            cmd = new SqlCommand(s, con);
            con.Open();
            SqlDataReader sd = cmd.ExecuteReader();
            return sd;
        }
        public DataSet fn_adapter(string s)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            SqlDataAdapter da = new SqlDataAdapter(s, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
}
}