using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectecom
{
    public partial class feedback : System.Web.UI.Page
    {
        Class1 fobj = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["id"]);
            string s = "insert into review_tab values(" + id + ",'" + TextBox1.Text + "','nil','1')";
            int i = fobj.fn_nonquery(s);
            if (i == 1)
            {
                Label1.Visible = true;
                Label1.Text = "Feedback Send";
            }
        }
    }
}