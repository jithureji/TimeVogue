using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;

namespace projectecom
{
    public partial class Login : System.Web.UI.Page
    {
        Class1 objlg = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            int i = Convert.ToInt32(Session["io"]);
            if (i == 1)
            {
                Label2.Visible = true;
                Label2.Text = "Now you can login";

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string s = "select count(login_regid) from login_tab where username='" + TextBox1.Text + "'and password='" + TextBox2.Text + "'";
            string count = objlg.fn_scalar(s);
            if (count == "1")
            {
                string i = "select login_regid from login_tab where username='" + TextBox1.Text + "'and password='" + TextBox2.Text + "'";
                string il = objlg.fn_scalar(i);
                Session["id"] = il;
                string u = "select log_type from login_tab where username='" + TextBox1.Text + "'and password='" + TextBox2.Text + "'";
                string ui = objlg.fn_scalar(u);
                if (ui == "User")
                {
                    Response.Redirect("Userhome.aspx");
                }
                else if (ui == "Admin")
                {
                    Response.Redirect("Adminhome.aspx");
                }
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "Invalid username or password";
            }
        }
    }
}