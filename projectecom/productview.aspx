<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="productview.aspx.cs" Inherits="projectecom.productview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .products-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            padding: 20px;
        }
        .product-card {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 15px;
            width: 240px;
            text-align: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.15);
            transition: transform 0.2s ease;
            background-color: #fff;
        }
        .product-card:hover {
            transform: scale(1.05);
        }
        .product-card img {
            border-radius: 8px;
            max-width: 100%;
            height: auto;
        }
        .product-card label {
            display: block;
            margin-top: 8px;
        }
        .product-name {
            font-weight: bold;
            font-size: 1.1rem;
        }
        .product-price {
            color: #16A085;
            font-weight: bold;
            margin-top: 5px;
        }
        .product-desc {
            font-size: 0.9rem;
            color: #555;
            margin-top: 6px;
        }
    </style>

    <div class="products-container">
        <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <ItemTemplate>
                <div class="product-card">
                    <asp:ImageButton ID="ImageButton1" runat="server" 
                        CommandArgument='<%# Eval("product_id") %>' 
                        ImageUrl='<%# Eval("product_image") %>' 
                        Height="200px" Width="200px" OnCommand="ImageButton1_Command" />
                    
                    <asp:Label ID="Label1" runat="server" 
                        CssClass="product-name"
                        Text='<%# Eval("product_name") %>'></asp:Label>

                    <asp:Label ID="Label2" runat="server" 
                        CssClass="product-price"
                        Text='<%# "₹ " + Eval("price") %>'></asp:Label>

                    <asp:Label ID="Label3" runat="server" 
                        CssClass="product-desc"
                        Text='<%# Eval("description") %>'></asp:Label>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
