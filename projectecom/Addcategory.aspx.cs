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
    public partial class addcategory : System.Web.UI.Page
    {
        Class1 objc = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string po = "~/phs/" + FileUpload1.FileName;
            FileUpload1.SaveAs(MapPath(po));
            string s = "insert into category_tab values('" + TextBox1.Text + "','" + po +"','"+TextBox2.Text+"','Available')";
            int i = objc.fn_nonquery(s);
            if (i == 1)
            {
                Label1.Visible = true;
                Label1.Text = "Inserted";
            }
        }
    }
}