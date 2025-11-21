<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="projectecom.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="register-container">
        <div class="register-box">
            <h2>Create Account</h2>

            <div class="form-group">
                <label for="TextBox1">Name</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="input-field"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="TextBox2">Email</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="input-field" TextMode="Email"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="TextBox3">Phone</label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="input-field"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="TextBox4">Address</label>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="input-field" TextMode="MultiLine" Rows="3"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="DropDownList1">State</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="input-field" AutoPostBack="True" 
                    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="DropDownList2">District</label>
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="input-field"></asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="TextBox7">Pincode</label>
                <asp:TextBox ID="TextBox7" runat="server" CssClass="input-field"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="TextBox8">Username</label>
                <asp:TextBox ID="TextBox8" runat="server" CssClass="input-field"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="TextBox9">Password</label>
                <asp:TextBox ID="TextBox9" runat="server" CssClass="input-field" TextMode="Password"></asp:TextBox>
            </div>

            <asp:Button ID="Button1" runat="server" Text="Register" CssClass="btn-register" OnClick="Button1_Click" />
        </div>
    </div>

    <style>
        .register-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px;
        }

        .register-box {
            background: linear-gradient(135deg, #e6f7ff, #f0fff4, #fffbea);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
            width: 100%;
            max-width: 600px;   /* ⬅️ increased width */
            animation: fadeIn 0.7s ease-in-out;
        }

        .register-box h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .input-field {
            width: 100%;
            padding: 12px;   /* bigger input */
            font-size: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            transition: 0.3s;
        }

        .input-field:focus {
            border-color: #00b894;
            box-shadow: 0 0 5px rgba(0,184,148,0.5);
            outline: none;
        }

        .btn-register {
            width: 100%;
            background-color: #00b894;
            color: white;
            padding: 14px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-register:hover {
            background-color: #019874;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</asp:Content>
