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
    public partial class bill : System.Web.UI.Page
    {
        Class1 objb = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bill_page();
            }
        }
        public void bill_page()
        {
            int a;
            int id = Convert.ToInt32(Session["id"]);
            string s= "SELECT dbo.product_tab.product_name, dbo.order_tab.quantity, dbo.product_tab.price, dbo.order_tab.amount FROM dbo.order_tab INNER JOIN dbo.product_tab ON dbo.order_tab.product_id = dbo.product_tab.product_id where usr_id="+id+"and order_status='order'";
            DataSet ds = objb.fn_adapter(s);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            string si="select usr_name,Address,Phone from usr_tab where usr_id="+id+"";
            SqlDataReader dr = objb.fn_reader(si);
            if (dr.Read())
            {
                Label2.Text = dr["usr_name"].ToString();
                Label3.Text = dr["Address"].ToString();
                Label4.Text = dr["Phone"].ToString();
            }
            string sl="select order_date from order_tab where usr_id="+id+" and order_status='order'";
            SqlDataReader da = objb.fn_reader(sl);
            if (da.Read())
            {
                Label1.Text = da["order_date"].ToString();
            }
            string am= "select sum(amount) from order_tab where usr_id=" + id + " and order_status='order'";
            string al = objb.fn_scalar(am);
            a = Convert.ToInt32(al);
            Label5.Text = a.ToString();
            Session["ta"] = a;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["id"]);
            string s = "update order_tab set order_status='complete' where usr_id=" + id + "";
            int i=objb.fn_nonquery(s);
            Response.Redirect("userpay.aspx");
        }
    }
}