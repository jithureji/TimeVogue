<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="userpay.aspx.cs" Inherits="projectecom.userpay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .payment-container {
            width: 60%;
            margin: 60px auto;
            padding: 40px;
            background: #ffffff;
            border-radius: 14px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            font-family: 'Segoe UI', sans-serif;
            color: #333;
        }

        .payment-header {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            color: #1a4d8f;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 30px;
        }

        .payment-form {
            width: 100%;
            border-collapse: collapse;
        }

        .payment-form td {
            padding: 10px 15px;
            font-size: 16px;
        }

        .payment-form td:first-child {
            font-weight: 600;
            width: 40%;
            color: #444;
        }

        .payment-form input[type="text"],
        .payment-form asp\:TextBox {
            width: 95%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: 0.2s ease;
        }

        .payment-form asp\:TextBox:focus {
            border-color: #1a4d8f;
            box-shadow: 0 0 6px rgba(26,77,143,0.3);
            outline: none;
        }

        .payment-button,
        .confirm-button {
            background-color: #1a4d8f;
            color: white;
            border: none;
            padding: 12px 35px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            transition: 0.3s ease;
        }

        .payment-button:hover,
        .confirm-button:hover {
            background-color: #16407a;
        }

        .balance-panel {
            background: #f6f9fc;
            border: 1px solid #d9e3f0;
            border-radius: 10px;
            padding: 20px;
            margin-top: 25px;
        }

        .balance-panel td {
            padding: 8px 10px;
            font-size: 16px;
        }

        .balance-panel td:first-child {
            font-weight: 600;
        }

        .confirm-section {
            text-align: center;
            margin-top: 25px;
        }

        .success-label {
            display: block;
            text-align: center;
            color: green;
            font-weight: bold;
            font-size: 18px;
            margin-top: 10px;
        }
    </style>

    <div class="payment-container">
        <div class="payment-header">Secure Payment</div>

        <table class="payment-form">
            <tr>
                <td>Enter Account No</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Select" CssClass="payment-button" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel ID="Panel1" runat="server" Visible="False" CssClass="balance-panel">
                        <table style="width:100%;">
                            <tr>
                                <td>Balance Amount</td>
                                <td><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Total Amount</td>
                                <td><asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>

        <div class="confirm-section">
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Confirm Payment" CssClass="confirm-button" />
            <asp:Label ID="Label3" runat="server" Text="Label" Visible="False" CssClass="success-label"></asp:Label>
        </div>
    </div>

</asp:Content>
