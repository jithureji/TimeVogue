using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectecom
{
    public partial class Usermanagement : System.Web.UI.Page
    {
        Class1 sobj = new Class1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grid_view();
            }
        }

        public void grid_view()
        {
            string f = "select usr_id, usr_name, Email, Phone, usr_status from usr_tab";
            DataSet ds = sobj.fn_adapter(f);

            // Normalize invalid status values
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string status = dr["usr_status"].ToString().Trim().ToLower();
                if (status != "active" && status != "inactive")
                    dr["usr_status"] = "inactive";
            }

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);

            RadioButtonList rad = (RadioButtonList)GridView1.Rows[i].FindControl("RadioButtonList1");
            string s = rad.SelectedItem.Text;

            // Corrected column name in WHERE clause
            string f = "update usr_tab set usr_status='" + s + "' where usr_id=" + getid;
            int c = sobj.fn_nonquery(f);

            GridView1.EditIndex = -1;
            grid_view();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            grid_view();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            grid_view();
        }
    }
}
