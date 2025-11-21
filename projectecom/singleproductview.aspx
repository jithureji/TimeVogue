<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="singleproductview.aspx.cs" Inherits="projectecom.singleproductview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Custom CSS for product cards -->
    <style>
        /* Product grid */
        .product-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        /* Card styling */
        .product-card {
            width: 280px;
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            animation: fadeInUp 0.8s ease;
        }
        .product-card:hover {
            transform: translateY(-8px);
            box-shadow: 0px 10px 20px rgba(0,0,0,0.2);
        }

        /* Product image */
        .product-img {
            height: 220px;
            width: 100%;
            object-fit: cover;
            transition: transform 0.4s ease;
        }
        .product-card:hover .product-img {
            transform: scale(1.05);
        }

        /* Button animations */
        .btn-animate {
            transition: all 0.3s ease-in-out;
        }
        .btn-animate:hover {
            transform: scale(1.1);
            box-shadow: 0px 6px 15px rgba(0, 128, 128, 0.4);
        }

        /* Fade-in animation for cards */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>

    <!-- DataList -->
    <asp:DataList ID="DataList1" runat="server" 
        OnItemCommand="DataList1_ItemCommand" 
        RepeatDirection="Horizontal" 
        RepeatColumns="3" 
        CellPadding="10"
        CssClass="product-list">

        <ItemTemplate>
            <div class="card product-card shadow-sm">
                <asp:Image ID="Image1" runat="server" CssClass="card-img-top product-img" 
                    ImageUrl='<%# Eval("product_image") %>' />

                <div class="card-body text-center">
                    <h5 class="card-title text-primary"><%# Eval("product_name") %></h5>
                    <p class="card-text text-success fw-bold">₹ <%# Eval("price") %></p>
                    <p class="card-text text-muted"><%# Eval("description") %></p>
                    <p class="text-dark">Stock: <%# Eval("product_stock") %></p>

                    <!-- Quantity dropdown -->
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select form-select-sm mb-2">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>

                    <!-- Buttons -->
                    <div class="d-flex justify-content-center gap-2">
                        <asp:Button ID="Button2" runat="server" Text="Add to Cart" 
                            CommandArgument='<%# Eval("product_id") %>' 
                            CommandName="AddToCart" CssClass="btn btn-success btn-animate" />
                        <asp:Button ID="Button3" runat="server" Text="Continue" CssClass="btn btn-outline-primary btn-animate" />
                    </div>

                    <!-- Message Label -->
                    <asp:Label ID="lblmessage" runat="server" Text="" CssClass="text-danger mt-2 d-block"></asp:Label>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
