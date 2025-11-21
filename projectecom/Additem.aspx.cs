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
    public partial class Additem : System.Web.UI.Page
    {
        Class1 obji = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            string d = "select category_name,category_id from category_tab";
            SqlDataReader dr = obji.fn_reader(d);
            DropDownList1.DataSource = dr;
            DropDownList1.DataTextField = "category_name";
            DropDownList1.DataValueField = "category_id";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("--Select Category--", "0"));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int cid =Convert.ToInt32(DropDownList1.SelectedValue);
            string cname = DropDownList1.SelectedItem.Text;
            string p = "~/phs/" + FileUpload1.FileName;
            FileUpload1.SaveAs(MapPath(p));
            string s = "insert into product_tab values('" + TextBox1.Text + "','" + TextBox2.Text + "'," + TextBox3.Text + ",'" + p + "'," + TextBox4.Text + "," + cid + ",'" + cname+ "')";
            int i = obji.fn_nonquery(s);
            if(i==1)
            {
                Label1.Visible = true;
            }
        }
    }
}