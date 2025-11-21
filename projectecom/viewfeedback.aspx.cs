using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace projectecom
{
    public partial class viewfeedback : System.Web.UI.Page
    {
        Class1 robj = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            string s = "SELECT dbo.review_tab.review, dbo.usr_tab.usr_name, dbo.review_tab.reply_msg, dbo.review_tab.review_id FROM dbo.usr_tab INNER JOIN dbo.review_tab ON dbo.usr_tab.usr_id = dbo.review_tab.usr_id where feedback_status='1'";
            DataSet ds = robj.fn_adapter(s);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            int getid = Convert.ToInt32(e.CommandArgument);
            Session["feedid"] = getid;
            Response.Redirect("Reply.aspx");
        }
    }
}