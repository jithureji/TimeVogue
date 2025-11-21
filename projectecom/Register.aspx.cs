using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace projectecom
{
    public partial class Register : System.Web.UI.Page
    {
        Class1 objr = new Class1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStates();
            }
        }

        private void LoadStates()
        {
            string s = "select state_id, state_name from state_tab";
            SqlDataReader dr = objr.fn_reader(s);

            DropDownList1.DataSource = dr;               // ✅ set datasource
            DropDownList1.DataTextField = "state_name";
            DropDownList1.DataValueField = "state_id";
            DropDownList1.DataBind();

            dr.Close(); // ✅ close reader

            DropDownList1.Items.Insert(0, new ListItem("-- Select State --", "0"));
            DropDownList2.Items.Clear();
            DropDownList2.Items.Insert(0, new ListItem("-- Select District --", "0"));
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList2.Items.Clear();

            if (DropDownList1.SelectedValue != "0")
            {
                string state = DropDownList1.SelectedValue;
                string d = "select district_id, district_name from district_tab where state_id=" + state;
                SqlDataReader di = objr.fn_reader(d);

                DropDownList2.DataSource = di;              // ✅ set datasource
                DropDownList2.DataTextField = "district_name";
                DropDownList2.DataValueField = "district_id";
                DropDownList2.DataBind();

                di.Close();
            }

            DropDownList2.Items.Insert(0, new ListItem("-- Select District --", "0"));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string district = DropDownList2.SelectedValue;
            string state = DropDownList1.SelectedValue;
            string c = "select count(usr_id) from usr_tab";
            string ci = objr.fn_scalar(c);
            int id = 0;
            if(ci=="")
            {
                id = 1;
            }
            else
            {
                int newid = Convert.ToInt32(ci);
                id = newid + 1;
            }
            string s = "insert into usr_tab values("+id+",'" + TextBox1.Text + "','" + TextBox2.Text + "'," + TextBox3.Text + ",'" + TextBox4.Text + "','" + state + "','" + district + "'," + TextBox7.Text + ",'" + TextBox8.Text + "','" + TextBox9.Text + "','Active')";
            int i = objr.fn_nonquery(s);
            string l = "insert into login_tab values(" + id + ",'" + TextBox8.Text + "','" + TextBox9.Text + "','User')";
            int li = objr.fn_nonquery(l);
            if(i==1&&li==1)
            {
                Session["io"] = i;
                Response.Redirect("Login.aspx");
            }
        }
    }
}