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
    public partial class productview : System.Web.UI.Page
    {
        Class1 objp = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string s = "select * from product_tab where category_id="+Session["uid"]+"";
                DataSet ds = objp.fn_adapter(s);
                DataList1.DataSource = ds;
                DataList1.DataBind();
            }
        }

        protected void ImageButton1_Command(object sender, CommandEventArgs e)
        {
            int getid = Convert.ToInt32(e.CommandArgument);
            Session["uid"] = getid;
            Response.Redirect("singleproductview.aspx");
        }
    }
}