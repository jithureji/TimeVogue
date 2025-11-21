<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="bill.aspx.cs" Inherits="projectecom.bill" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .invoice-container {
            width: 80%;
            margin: 40px auto;
            padding: 30px;
            background: #fff;
            border: 2px solid #444;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.15);
            font-family: 'Segoe UI', sans-serif;
            color: #333;
        }
        .invoice-header {
            text-align: center;
            font-size: 26px;
            font-weight: bold;
            margin-bottom: 30px;
            color: #2b2b2b;
            border-bottom: 2px solid #555;
            padding-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .invoice-details td {
            padding: 8px 10px;
            font-size: 16px;
        }
        .invoice-details td:first-child {
            font-weight: 600;
            color: #444;
        }
        .product-list-title {
            text-align: center;
            font-size: 20px;
            margin: 30px 0 10px 0;
            font-weight: bold;
            color: #2d4a7f;
            text-transform: uppercase;
        }
        .grid-container {
            text-align: center;
        }
        .grid-container asp\:GridView {
            border: 1px solid #ccc;
        }
        .total-amount {
            text-align: right;
            font-size: 18px;
            margin-top: 20px;
            font-weight: bold;
            color: #222;
        }
        .pay-button {
            text-align: center;
            margin-top: 30px;
        }
        .pay-button asp\:Button {
            background: #4CAF50;
            color: white;
            border: none;
            padding: 12px 40px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
        }
        .pay-button asp\:Button:hover {
            background: #45a049;
        }
    </style>

    <div class="invoice-container">
        <div class="invoice-header">Invoice Bill</div>

        <table class="invoice-details" style="width:100%;">
            <tr>
                <td>Date:</td>
                <td><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>Phone no:</td>
                <td><asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
            </tr>
        </table>

        <div class="product-list-title">Product List</div>

        <div class="grid-container">
            <asp:GridView ID="GridView1" runat="server" Height="199px" Width="794px"></asp:GridView>
        </div>

        <div class="total-amount">
            Total Amount: Rs <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
        </div>

        <div class="pay-button">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Pay" />
        </div>
    </div>

</asp:Content>
