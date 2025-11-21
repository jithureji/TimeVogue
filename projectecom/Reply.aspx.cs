using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Text;

namespace projectecom
{
    public partial class Reply : System.Web.UI.Page
    {
        Class1 rpobj = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Session["id"]);
                string s = "select Email from admin_tab where admin_id=" + id + "";
                SqlDataReader dr = rpobj.fn_reader(s);
                while (dr.Read())
                {
                    TextBox2.Text = dr["Email"].ToString();
                }
                string z = "SELECT dbo.usr_tab.Email FROM dbo.usr_tab INNER JOIN dbo.review_tab ON dbo.usr_tab.usr_id = dbo.review_tab.usr_id where dbo.review_tab.review_id=" + Session["feedid"] + "";
                SqlDataReader dr1 = rpobj.fn_reader(z);
                while (dr1.Read())
                {
                    TextBox1.Text = dr1["Email"].ToString();
                }

            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["id"]);
            string s = "select admin_name from admin_tab where admin_id=" + id + "";
            string cv = rpobj.fn_scalar(s);
            string z = "SELECT dbo.usr_tab.usr_name FROM dbo.usr_tab INNER JOIN dbo.review_tab ON dbo.usr_tab.usr_id = dbo.review_tab.usr_id where dbo.review_tab.review_id=" + Session["feedid"] + "";
            string gh = rpobj.fn_scalar(z);
            SendEmail2(cv, TextBox2.Text, "pqcz lcke gvzz zpfr", gh, TextBox1.Text, TextBox3.Text, TextBox4.Text);
            string ms = "update review_tab set feedback_status='0' where review_id="+Session["feedid"]+"";
            int i = rpobj.fn_nonquery(ms);
        }
        public static void SendEmail2(string yourname, string yourGmailUserName, string yourGmailPassword, string tonaame, string toEmail, string subject, string body)

        {
            string to = toEmail; //To address    
            string from = yourGmailUserName; //From address    
            MailMessage message = new MailMessage(from, to);

            string mailbody = body;
            message.Subject = subject;
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            System.Net.NetworkCredential basicCredential1 = new
            System.Net.NetworkCredential(yourGmailUserName, yourGmailPassword);
            client.EnableSsl = true;
            client.UseDefaultCredentials = true;
            client.Credentials = basicCredential1;
            try
            {
                client.Send(message);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}