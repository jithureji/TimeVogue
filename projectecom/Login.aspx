<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="projectecom.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .login-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 40px;
            animation: fadeIn 0.8s ease-in-out;
        }

        .login-box {
            background: #ffffff;
            border-radius: 15px;
            padding: 40px 30px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .login-box h2 {
            margin-bottom: 25px;
            color: #2c3e50;
            font-size: 24px;
        }

        .login-box label {
            display: block;
            text-align: left;
            margin-bottom: 6px;
            color: #333;
            font-weight: bold;
        }

        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-size: 14px;
        }

        .login-box input[type="text"]:focus,
        .login-box input[type="password"]:focus {
            border-color: #4A90E2;
            box-shadow: 0 0 6px rgba(74,144,226,0.4);
            outline: none;
            transform: scale(1.02);
        }

        .login-box .btn-login {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background: linear-gradient(90deg, #4A90E2, #3CB371);
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .login-box .btn-login:hover {
            background: linear-gradient(90deg, #3CB371, #4A90E2);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>

    <div class="login-container">
        <div class="login-box">
            <h2>Login</h2>

            <asp:Label ID="Label2" runat="server" Visible="False" CssClass="status-label"></asp:Label>

            <label for="TextBox1">Username</label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>

            <label for="TextBox2">Password</label>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>

            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" CssClass="btn-login" />

            <asp:Label ID="Label1" runat="server" Visible="False" CssClass="status-label"></asp:Label>
        </div>
    </div>
</asp:Content>
