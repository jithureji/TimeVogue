<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Usermanagement.aspx.cs" Inherits="projectecom.Usermanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        .grid-container {
            max-width: 750px;
            margin: 40px auto;
        }
    </style>

    <div class="grid-container">
        <h2 class="text-center mb-4">Users List</h2>

        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="usr_id"
            CssClass="table table-bordered table-hover text-center"
            OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowEditing="GridView1_RowEditing"
            OnRowUpdating="GridView1_RowUpdating">

            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="usr_name" HeaderText="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" />

                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                            SelectedValue='<%# (Eval("usr_status") != DBNull.Value && Eval("usr_status").ToString().Trim().ToLower() == "active") ? "active" : "inactive" %>'>
                            <asp:ListItem Value="active">Active</asp:ListItem>
                            <asp:ListItem Value="inactive">Inactive</asp:ListItem>
                        </asp:RadioButtonList>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
