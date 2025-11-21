<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master"
    AutoEventWireup="true" CodeBehind="Edititem.aspx.cs" Inherits="projectecom.Edititem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" runat="server" 
        AutoGenerateColumns="False"
        DataKeyNames="product_id"
        OnRowEditing="GridView1_RowEditing"
        OnRowUpdating="GridView1_RowUpdating"
        OnRowDeleting="GridView1_RowDeleting"
        OnRowCancelingEdit="GridView1_RowCancelingEdit">

        <Columns>
            <asp:BoundField DataField="product_id" HeaderText="Product ID" ReadOnly="True" />

            <asp:TemplateField HeaderText="Product Name">
                <ItemTemplate>
                    <%# Eval("product_name") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtProductName" runat="server" Text='<%# Bind("product_name") %>' />
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Description">
                <ItemTemplate>
                    <%# Eval("description") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("description") %>' />
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    <%# Eval("price") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("price") %>' />
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Stock">
                <ItemTemplate>
                    <%# Eval("product_stock") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtStock" runat="server" Text='<%# Bind("product_stock") %>' />
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Category ID">
                <ItemTemplate>
                    <%# Eval("category_id") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtCategoryId" runat="server" Text='<%# Bind("category_id") %>' />
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Category">
                <ItemTemplate>
                    <%# Eval("category") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtCategory" runat="server" Text='<%# Bind("category") %>' />
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("product_image") %>' Height="80px" Width="80px" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:FileUpload ID="fuProductImage" runat="server" />
                    <asp:HiddenField ID="hfImagePath" runat="server" Value='<%# Bind("product_image") %>' />
                    <asp:Image ID="imgPreview" runat="server" ImageUrl='<%# Eval("product_image") %>' Height="80px" Width="80px" />
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowDeleteButton="True" />
            <asp:CommandField ShowEditButton="True" />
        </Columns>
    </asp:GridView>

</asp:Content>
