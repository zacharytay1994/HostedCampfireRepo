<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="calenderRecommend.aspx.cs" Inherits="CampfirePlanner.ASP.Net.CalenderPages.calenderRecommend" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            height: 26px;
        }
        .auto-style4 {
            height: 26px;
            width: 362px;
            font-family: "Segoe UI";
            font-weight: bold;
        }
        .auto-style5 {
            width: 362px;
            font-family: "Segoe UI";
            font-weight: bold;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="w-100">
        <tr>
            <td class="auto-style4">Select Day:</td>
            <td class="auto-style3">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Label ID="lblDay" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style3">
                </td>
        </tr>
        <tr>
            <td class="auto-style4">Start Time:</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtStart" type="time" runat="server"></asp:TextBox>
                <asp:Label ID="lblStart" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">End Time:</td>
            <td>
                <asp:TextBox ID="txtEnd" type="time" runat="server"></asp:TextBox>
                <asp:Label ID="lblEnd" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style3">
                <asp:Button ID="btnRecommendation" runat="server" OnClick="btnRecommendation_Click" Text="Get Recommendation" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td>
                <asp:Label ID="lblActivity" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td>
                <asp:ListBox ID="ListBox1" runat="server" Width="134px">
                    <asp:ListItem>Land</asp:ListItem>
                    <asp:ListItem>Sea</asp:ListItem>
                </asp:ListBox>
                <asp:GridView ID="gvRecommendation" runat="server">
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td>
                <asp:Button ID="btnReset" runat="server" Text="Reset" />
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnConfirm_Click" />
                <asp:Label ID="lblAdd" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
