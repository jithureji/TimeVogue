<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="singleproduct.aspx.cs" Inherits="projectecom.singleproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand">
    <ItemTemplate>
        <table style="width: 100%">
            <tr>
                <td style="height: 265px">
                    <asp:Image ID="Image1" runat="server" Height="261px" ImageUrl='<%# Eval("product_image") %>' Width="235px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("product_name") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="height: 27px">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("product_stock") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="Add to cart" CommandArgument='<%# Eval("product_id") %>' CommandName="AddToCart" />
                    <asp:Button ID="Button3" runat="server" Text="Continue" />
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
</asp:Content>
