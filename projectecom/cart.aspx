<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="projectecom.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .cart-container {
            width: 85%;
            margin: 40px auto;
            padding: 25px 40px;
            background: #ffffff;
            border-radius: 14px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
            font-family: 'Segoe UI', sans-serif;
        }

        .cart-title {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 25px;
            color: #2b2b2b;
            border-bottom: 3px solid #3c6e71;
            padding-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .cart-grid {
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .cart-grid asp\:GridView {
            width: 100%;
        }

        .cart-grid .GridView {
            width: 100%;
            border-collapse: collapse;
        }

        .cart-grid .GridView th {
            background-color: #3c6e71;
            color: white;
            text-align: left;
            padding: 12px;
            font-size: 16px;
        }

        .cart-grid .GridView td {
            padding: 12px;
            border-bottom: 1px solid #eee;
            font-size: 15px;
        }

        .cart-grid .GridView tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .cart-actions {
            text-align: center;
            margin-top: 30px;
        }

        .cart-actions asp\:Button {
            background-color: #2a9d8f;
            color: white;
            border: none;
            padding: 12px 35px;
            margin: 0 15px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .cart-actions asp\:Button:hover {
            background-color: #21867a;
        }

        .cart-actions .clear-btn {
            background-color: #e63946;
        }

        .cart-actions .clear-btn:hover {
            background-color: #c82333;
        }

        .cart-empty {
            text-align: center;
            color: #777;
            font-size: 18px;
            margin-top: 20px;
        }
    </style>

    <div class="cart-container">
        <div class="cart-title">Your Shopping Cart</div>

        <div class="cart-grid">
            <asp:GridView ID="GridView1" runat="server"
                CssClass="GridView"
                AutoGenerateColumns="False"
                DataKeyNames="cart_id"
                OnRowEditing="GridView1_RowEditing"
                OnRowUpdating="GridView1_RowUpdating"
                OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowDeleting="GridView1_RowDeleting">

                <Columns>
                    <asp:BoundField DataField="product_name" HeaderText="Product" ReadOnly="True" />
                    <asp:BoundField DataField="price" HeaderText="Price" ReadOnly="True" />
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="total_amount" HeaderText="Total" ReadOnly="True" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>

        <div class="cart-actions">
            <asp:Button ID="Button1" runat="server" Text="Clear Cart" CssClass="clear-btn" />
            <asp:Button ID="Button2" runat="server" Text="Buy Now" OnClick="Button2_Click" />
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
    </div>

</asp:Content>
