using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectecom
{
    public partial class singleproduct : System.Web.UI.Page
    {
        Class1 objsp = new Class1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["uid"] != null)
                {
                    string s = "SELECT * FROM product_tab WHERE product_id=" + Session["uid"];
                    DataSet ds = objsp.fn_adapter(s);
                    DataList1.DataSource = ds;
                    DataList1.DataBind();
                }
                else
                {
                    Response.Redirect("products.aspx"); // redirect if uid missing
                }
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                DropDownList ddl = (DropDownList)e.Item.FindControl("DropDownList1");
                int quantity = Convert.ToInt32(ddl.SelectedValue);
                int productId = Convert.ToInt32(e.CommandArgument);

                if (Session["id"] != null)
                {
                    int userId = Convert.ToInt32(Session["id"]);

                    // Get price using your function
                    string q = "SELECT price FROM product_tab WHERE product_id=" + productId;
                    string qs = objsp.fn_scalar(q);
                    int price = Convert.ToInt32(qs);
                    int totalPrice = quantity * price;
                    string query = "INSERT INTO cart_table (product_id, usr_id, quantity, total_amount) " +
                                   "VALUES (" + productId + ", " + userId + ", " + quantity + ", " + totalPrice + ")";
                    int cs = objsp.fn_nonquery(query);

                    if (cs > 0)
                    {
                        
                        //Response.Redirect("cart.aspx");
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Userhome.aspx");
        }
    }
}
