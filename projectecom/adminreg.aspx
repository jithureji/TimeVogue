<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="adminreg.aspx.cs" Inherits="projectecom.adminreg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%">
        <tr>
            <td style="width: 89px">Name</td>
            <td style="width: 209px">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 89px; height: 29px;">Phone</td>
            <td style="width: 209px; height: 29px;">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 89px">Email</td>
            <td style="width: 209px">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 89px">Username</td>
            <td style="width: 209px">
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 89px">Password</td>
            <td style="width: 209px">
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 89px">&nbsp;</td>
            <td style="width: 209px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 89px">&nbsp;</td>
            <td style="width: 209px">
                <asp:Button ID="Button" runat="server" ForeColor="#66FF66" OnClick="Button_Click" Text="Register" />
            </td>
        </tr>
    </table>
</asp:Content>
