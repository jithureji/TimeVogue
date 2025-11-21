using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectecom
{
    public partial class userpay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int ba = Convert.ToInt32(ViewState["ba"]);
            int b = Convert.ToInt32(ViewState["b"]);
            if (b < ba)
            {
                int cbal = ba - b;
                balupdate_Service.ServiceClient obj = new balupdate_Service.ServiceClient();
                int updated = obj.balanceupdate(TextBox1.Text, cbal);
                if (updated == 1)
                {
                    Label3.Visible = true;
                    Label3.Text = "Payment Succcessful";
                }
            }
            else
            {
                Label3.Visible = true;
                Label3.Text = "Insufficient balance";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            balupdate_Service.ServiceClient obj = new balupdate_Service.ServiceClient();
            string bal = obj.Balcheck(TextBox1.Text);
            Panel1.Visible = true;
            Label2.Text = bal;
            int ba = Convert.ToInt32(bal);
            int b = Convert.ToInt32(Session["ta"]);
            ViewState["ba"] = ba;
            ViewState["b"] = b;
            Label3.Text = b.ToString();
        }
    }
}