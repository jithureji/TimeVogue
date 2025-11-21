<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Userhome.aspx.cs" Inherits="projectecom.userhome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .item-card {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 15px;
            text-align: center;
            width: 220px;
            background: #fff;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .item-card img {
            border-radius: 8px;
            transition: transform 0.3s ease-in-out;
        }

        /* Hover floating effect */
        .item-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
        }

        .item-card:hover img {
            transform: scale(1.05);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" 
        RepeatDirection="Horizontal" 
        RepeatColumns="3" 
        CellPadding="10" CellSpacing="10" 
        RepeatLayout="Table">
        <ItemTemplate>
            <div class="item-card">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    Height="200px" Width="200px"
                    ImageUrl='<%# Eval("category_image") %>' 
                    CommandArgument='<%# Eval("category_id") %>' 
                    OnCommand="ImageButton1_Command" />
                <br /><br />
                <asp:Label ID="Label1" runat="server" 
                    Text='<%# Eval("category_name") %>' 
                    Font-Bold="true"></asp:Label>
                <br />
                <asp:Label ID="Label2" runat="server" 
                    Text='<%# Eval("description") %>'></asp:Label>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
