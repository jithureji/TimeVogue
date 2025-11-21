using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace projectecom
{
    public partial class Edititem : System.Web.UI.Page
    {
        Class1 obje = new Class1();
        SqlConnection con = new SqlConnection(@"server=LAPTOP-LGM6III9\SQLEXPRESS;database=Ecom;Integrated security=true");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grid_bind();
            }
        }

        // ✅ Bind data
        private void grid_bind()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM product_tab", con))
            {
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();
            }
        }

        // ✅ Editing
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            grid_bind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            grid_bind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);
            string s = "DELETE FROM product_tab WHERE product_id=" + getid;
            obje.fn_nonquery(s);
            grid_bind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);

            TextBox txtname = (TextBox)GridView1.Rows[i].FindControl("txtProductName");
            TextBox txtdescription = (TextBox)GridView1.Rows[i].FindControl("txtDescription");
            TextBox txtprice = (TextBox)GridView1.Rows[i].FindControl("txtPrice");
            TextBox txtstock = (TextBox)GridView1.Rows[i].FindControl("txtStock");
            TextBox txtcategory_id = (TextBox)GridView1.Rows[i].FindControl("txtCategoryId");
            TextBox txtcategory = (TextBox)GridView1.Rows[i].FindControl("txtCategory");

            FileUpload fuImage = (FileUpload)GridView1.Rows[i].FindControl("fuProductImage");
            HiddenField hfImagePath = (HiddenField)GridView1.Rows[i].FindControl("hfImagePath");

            string imagePath = hfImagePath.Value;
            if (fuImage.HasFile)
            {
                string fileName = System.IO.Path.GetFileName(fuImage.FileName);
                imagePath = "~/phs/" + fileName;
                fuImage.SaveAs(Server.MapPath(imagePath));
            }

            string str = "UPDATE product_tab SET product_name='" + txtname.Text + "', description='" + txtdescription.Text +
                         "', price=" + txtprice.Text + ", product_image='" + imagePath + "', product_stock=" + txtstock.Text +
                         ", category_id=" + txtcategory_id.Text + ", category='" + txtcategory.Text + "' WHERE product_id=" + getid;

            obje.fn_nonquery(str);

            GridView1.EditIndex = -1;
            grid_bind();
        }
    }
}
