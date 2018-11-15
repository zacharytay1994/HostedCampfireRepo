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
        .auto-style6 {
            width: 362px;
            font-family: "Segoe UI";
            font-weight: bold;
            height: 211px;
        }
        .auto-style7 {
            height: 211px;
        }
        .auto-style8 {
            width: 362px;
            font-family: "Segoe UI";
            font-weight: bold;
            height: 38px;
        }
        .auto-style9 {
            height: 38px;
        }
        </style>
    <link rel="stylesheet" href="~/ASP.Net/CalenderPages/calenderRecommend/Css/calendarRecommend.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body2" runat="server">
    <table class="w-100">
        <tr>
            <td class="auto-style4">Select Day:</td>
            <td class="auto-style3">
                <asp:RadioButtonList ID="rblDay" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rblDay_SelectedIndexChanged">
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
            <td class="auto-style5">&nbsp;</td>
            <td>
                <asp:RequiredFieldValidator ID="rfvTime" runat="server" ControlToValidate="txtStart" Display="Dynamic" ErrorMessage="Please give us the intended times of activity!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td>
                <asp:Label ID="lblValidTime" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style3">
                <asp:Button ID="btnRecommendation" runat="server" OnClick="btnRecommendation_Click" Text="Get Recommendation" Width="176px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style8"></td>
            <td class="auto-style9">
                <asp:Label ID="lblActivity" runat="server" Font-Size="X-Large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6"></td>
            <td class="auto-style7">
                <asp:GridView ID="gvRecommendation" runat="server" EmptyDataText="There are no activities!" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowPaging="True" OnPageIndexChanging="gvRecommendation_PageIndexChanging" PageSize="5" OnSelectedIndexChanged="gvRecommendation_SelectedIndexChanged" OnSelectedIndexChanging="gvRecommendation_SelectedIndexChanging" Width="890px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ActivityID" HeaderText="ID" />
                        <asp:BoundField HeaderText="Name" DataField="ActivityName" />
                        <asp:BoundField HeaderText="Category" DataField="CategoryID" />
                        <asp:BoundField HeaderText="Duration" DataField="Duration" />
                        <asp:HyperLinkField Text="View Activity" />
                        <asp:ButtonField Text="Select" CommandName="Select" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                <asp:Label ID="lblGrid" runat="server"></asp:Label>
                <asp:Label ID="lblAdd" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td>
                <asp:Button ID="btnReturn" runat="server" Text="Return to Event Page" CausesValidation="False" OnClick="btnReturn_Click" />
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                <asp:Label ID="lblAdded" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
