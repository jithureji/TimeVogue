<%@ Page Title="Admin Home" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Adminhome.aspx.cs" Inherits="projectecom.adminhome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .admin-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px;
            animation: fadeIn 0.8s ease-in-out;
        }

        .admin-container h1 {
            font-size: 28px;
            margin-bottom: 30px;
            color: #2c3e50;
            text-align: center;
        }

        .admin-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 25px;
            width: 100%;
            max-width: 900px;
        }

        .admin-card {
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
            text-align: center;
            padding: 30px 20px;
            transition: all 0.3s ease;
        }

        .admin-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 24px rgba(0,0,0,0.25);
        }

        .admin-card h3 {
            margin-bottom: 20px;
            color: #333;
        }

        .admin-btn {
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

        .admin-btn:hover {
            background: linear-gradient(90deg, #3CB371, #4A90E2);
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>

    <div class="admin-container">
        <h1>Admin Dashboard</h1>

        <div class="admin-actions">
            <div class="admin-card">
                <h3>Add New Item</h3>
                <asp:Button ID="Button1" runat="server" Text="Add Item" CssClass="admin-btn" OnClick="Button1_Click" />
            </div>

            <div class="admin-card">
                <h3>Edit Items</h3>
                <asp:Button ID="Button2" runat="server" Text="Edit Item" CssClass="admin-btn" OnClick="Button2_Click" />
            </div>

            <div class="admin-card">
                <h3>View Orders</h3>
                <asp:Button ID="Button3" runat="server" Text="View Orders" CssClass="admin-btn" />
            </div>

            <div class="admin-card">
                <h3>Add Category</h3>
                <asp:Button ID="Button4" runat="server" Text="Add Category" CssClass="admin-btn" OnClick="Button4_Click" />
            </div>

            <div class="admin-card">
                <h3>View Feedback</h3>
                <asp:Button ID="Button5" runat="server" Text="view Feedback" CssClass="admin-btn" OnClick="Button5_Click" />
            </div>
                        <div class="admin-card">
                <h3>View Feedback</h3>
                <asp:Button ID="Button6" runat="server" Text="User Management" CssClass="admin-btn" OnClick="Button6_Click" />
            </div>
        </div>
    </div>
</asp:Content>
