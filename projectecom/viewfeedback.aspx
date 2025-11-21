<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="viewfeedback.aspx.cs" Inherits="projectecom.viewfeedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .feedback-container {
            width: 85%;
            margin: 40px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 14px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            font-family: 'Segoe UI', sans-serif;
        }

        .feedback-title {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 30px;
            color: #1a4d8f;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-bottom: 3px solid #1a4d8f;
            padding-bottom: 10px;
        }

        .feedback-grid {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
        }

        .feedback-grid asp\:GridView {
            width: 100%;
        }

        .feedback-grid .GridView {
            width: 100%;
            border-collapse: collapse;
        }

        .feedback-grid .GridView th {
            background-color: #1a4d8f;
            color: #fff;
            padding: 12px;
            text-align: left;
            font-size: 16px;
        }

        .feedback-grid .GridView td {
            padding: 12px;
            font-size: 15px;
            border-bottom: 1px solid #e5e5e5;
        }

        .feedback-grid .GridView tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .feedback-grid .GridView tr:hover {
            background-color: #eef3fa;
        }

        .feedback-grid asp\:LinkButton {
            background: #2a9d8f;
            color: white !important;
            padding: 6px 14px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            transition: 0.3s ease;
        }

        .feedback-grid asp\:LinkButton:hover {
            background: #21867a;
        }

        .no-feedback {
            text-align: center;
            color: #666;
            font-size: 18px;
            padding: 20px;
        }
    </style>

    <div class="feedback-container">
        <div class="feedback-title">User Feedback</div>

        <div class="feedback-grid">
            <asp:GridView ID="GridView1" runat="server" 
                AutoGenerateColumns="False"
                CssClass="GridView">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="usr_name" HeaderText="User Name" />
                    <asp:BoundField DataField="review" HeaderText="Feedback" />
                    <asp:BoundField DataField="reply_msg" HeaderText="Reply" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("review_id") %>' OnCommand="LinkButton1_Command">
                                Reply
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
