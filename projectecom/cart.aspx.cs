using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace projectecom
{
    public partial class cart : System.Web.UI.Page
    {
        Class1 objct = new Class1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grid_bind();
            }
        }

        public void grid_bind()
        {
            int p = 1;
            int id = Convert.ToInt32(Session["id"]);
            string s = @"SELECT c.cart_id, p.product_name, p.price, 
                                c.quantity, (p.price * c.quantity) AS total_amount
                         FROM cart_table c
                         INNER JOIN product_tab p ON c.product_id = p.product_id
                         WHERE c.usr_id = " + id+"and cart_status="+p+"";
            DataSet dt = objct.fn_adapter(s);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

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

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int cartId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string p= "SELECT dbo.product_tab.price FROM dbo.cart_table INNER JOIN dbo.product_tab ON dbo.cart_table.product_id = dbo.product_tab.product_id where cart_id="+cartId+"";
            string pr = objct.fn_scalar(p);
            int prices = Convert.ToInt32(pr);
            // Column index 2 = Quantity (since 0=product_name, 1=price, 2=quantity)
            TextBox txtQty = (TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0];
            int newQty = Convert.ToInt32(txtQty.Text);

            string s = "UPDATE cart_table SET quantity=" + newQty + " WHERE cart_id=" + cartId;
            objct.fn_nonquery(s);
            string c = "select quantity from cart_table where cart_id=" + cartId + "";
            string co = objct.fn_scalar(c);
            int getsub = Convert.ToInt32(co);
            string f = "update cart_table set total_amount=" + getsub * prices + "where cart_id=" + cartId + "";
            int l = objct.fn_nonquery(f);
            GridView1.EditIndex = -1;
            grid_bind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int cartId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string s = "DELETE FROM cart_table WHERE cart_id=" + cartId;
            objct.fn_nonquery(s);

            grid_bind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["id"]);
            string f = "select product_id from cart_table where usr_id=" + id + "and cart_status=1";
            SqlDataReader dr = objct.fn_reader(f);
            List<string> pdlist = new List<string>();
            while (dr.Read())
            {
                pdlist.Add((dr["product_id"].ToString()));
            }
            dr.Close();
            foreach (string productid in pdlist)
            {
                string d = "select * from cart_table where product_id=" + productid + "and usr_id=" + Session["id"] + "";
                SqlDataReader dv = objct.fn_reader(d);
                string subtotal = "", qty = "";
                while (dv.Read())
                {
                    subtotal = (dv["total_amount"].ToString());
                    qty = (dv["quantity"].ToString());
                }
                dv.Close();
                string w = "insert into order_tab values(" + id + "," + productid + ",'" + DateTime.Now.ToString("yyyy-MM-dd") + "'," + subtotal + ",'order'," + qty + ")";
                int i = objct.fn_nonquery(w);
                string k = "update cart_table set cart_status=0 where product_id=" + productid + "";
                int g = objct.fn_nonquery(k);
                int qntin = Convert.ToInt32(qty);
                string qn = "select product_stock from product_tab where product_id=" + productid + "" ;
                string qnt = objct.fn_scalar(qn);
                int qnty = Convert.ToInt32(qnt);
                int newqnty = qnty - qntin;
                string up = "update product_tab set product_stock=" + newqnty + " where product_id=" + productid + "";
                int upd = objct.fn_nonquery(up);
            }
            string a = "select sum(amount) from order_tab where usr_id=" + id + "and order_status='order'";
            string l = objct.fn_scalar(a);

            string q = "insert into bill_tab values(" + id + "," + l + ",'" + DateTime.Now.ToString("yyyy-MM-dd").ToString() + "')";
            int t = objct.fn_nonquery(q);
            if (t == 1)
            {
                Label1.Visible = true;
                Label1.Text = "success";
                Response.Redirect("bill.aspx");
            }
        }
    }
}
