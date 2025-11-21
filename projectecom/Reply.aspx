<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Reply.aspx.cs" Inherits="projectecom.Reply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .reply-container {
            width: 60%;
            margin: 50px auto;
            background-color: #ffffff;
            border-radius: 14px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            padding: 40px 50px;
            font-family: 'Segoe UI', sans-serif;
        }

        .reply-title {
            text-align: center;
            font-size: 26px;
            font-weight: bold;
            color: #1a4d8f;
            text-transform: uppercase;
            margin-bottom: 30px;
            border-bottom: 3px solid #1a4d8f;
            padding-bottom: 8px;
        }

        .reply-form {
            width: 100%;
        }

        .reply-form td {
            padding: 12px 10px;
            font-size: 16px;
            color: #333;
        }

        .reply-form td:first-child {
            width: 25%;
            font-weight: 600;
        }

        .reply-input {
            width: 95%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: 0.3s;
        }

        .reply-input:focus {
            border-color: #1a4d8f;
            outline: none;
            box-shadow: 0 0 4px rgba(26,77,143,0.3);
        }

        .reply-body {
            height: 120px;
            resize: vertical;
        }

        .reply-btn {
            background: #2a9d8f;
            color: #fff;
            font-weight: bold;
            font-size: 16px;
            padding: 10px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
        }

        .reply-btn:hover {
            background: #21867a;
        }

        .reply-btn:active {
            transform: scale(0.97);
        }
    </style>

    <div class="reply-container">
        <div class="reply-title">Send Feedback Reply</div>

        <table class="reply-form">
            <tr>
                <td>To</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="reply-input" placeholder="Recipient email address"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>From</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="reply-input" placeholder="Your email address"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Subject</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="reply-input" placeholder="Enter subject"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Body</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="reply-input reply-body" TextMode="MultiLine" placeholder="Write your message here..."></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Send Reply" CssClass="reply-btn" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
