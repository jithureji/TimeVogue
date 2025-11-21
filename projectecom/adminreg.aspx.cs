using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace projectecom
{
    public partial class adminreg : System.Web.UI.Page
    {
        Class1 objar = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Click(object sender, EventArgs e)
        {
            string c = "select count(admin_id) from admin_tab";
            string ci = objar.fn_scalar(c);
            int id = 0;
            if (ci == "")
            {
                id = 1;
            }
            else
            {
                int newid = Convert.ToInt32(ci);
                id = newid + 1;
            }
            string s = "insert into admin_tab values(" + id + ",'" + TextBox1.Text + "'," + TextBox2.Text + ",'" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "')";
            int i = objar.fn_nonquery(s);
            string l = "insert into login_tab values(" + id + ",'" + TextBox4.Text + "','" + TextBox5.Text + "','Admin')";
            int li = objar.fn_nonquery(l);
            if (i == 1 && li == 1)
            {
                Session["io"] = i;
                Response.Redirect("Login.aspx");
            }
        }
    }
}