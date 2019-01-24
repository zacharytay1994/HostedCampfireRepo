<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="calendarEventMain.aspx.cs" Inherits="CampfirePlanner.ASP.Net.CalenderPages.calendarEventMain.calendarEventMain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="calenderEventMain.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:Extra-Bold" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet"/>
    <style type="text/css">
        .auto-style2 {
            display: block;
            margin-bottom: 50px;
            text-align: center;
            font-family: Georgia;
            text-decoration: underline;
            padding-top: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <main>
    <div>
        <asp:Label ID="lblWelcome" runat="server" CssClass="auto-style2" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
        <br />
        <asp:Label ID="lblCollabInfo" runat="server" Font-Bold="True" Font-Size="XX-Large" Visible="True"></asp:Label>
        <br />
            <asp:Label ID="lblCollab" runat="server" Font-Bold="False" Visible="False"></asp:Label>
        <br />
        <asp:GridView ID="gvCollab" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="118px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="AccountID" HeaderText="User" />
                <asp:BoundField DataField="Username" HeaderText="Username" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <br />
    </div>
    <div>
        <h2 style="font-family:Georgia; font-weight: bold; text-align: left; border-bottom:solid; border-left: solid; border-left-width: 20px; border-color:dodgerblue; padding-left:10px; width: 90%; margin-left: 5%;">Current Events</h2>
        <asp:GridView ID="gvEvents" runat="server" EmptyDataText="There are no Events!" CssClass="eventGrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" SelectedRowStyle-CssClass="selectedRows" AllowPaging="True" AutoGenerateColumns="False" HorizontalAlign="Center" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="gvEvents_SelectedIndexChanged" OnPageIndexChanging="gvEvents_PageIndexChanging">
            <%--<AlternatingRowStyle BackColor="White" />--%>
            <Columns>
                <asp:BoundField DataField="EventID" HeaderText="Event ID" />
                <asp:BoundField DataField="StartDate" DataFormatString="{0:MM-dd-yyyy}" HeaderText="Start Date" />
                <asp:BoundField DataField="EndDate" DataFormatString="{0:MM-dd-yyyy}" HeaderText="End Date" />
                <asp:BoundField DataField="EventName" HeaderText="Event Name" />
                <asp:ButtonField CommandName="Select" Text="Collaborators" HeaderText="Collaborators"/>
                <asp:HyperLinkField DataNavigateUrlFields="EventID" DataNavigateUrlFormatString="../calenderViewDay/calenderViewDay.aspx?eventID={0}" Text="View" HeaderText="Details" />
                <asp:HyperLinkField DataNavigateUrlFields="EventID" DataNavigateUrlFormatString="../calenderRecommend/calenderRecommend.aspx?eventID={0}" Text="Add Activity" HeaderText="Add Activity" />
            </Columns>

<HeaderStyle CssClass="header"></HeaderStyle>

            <PagerStyle HorizontalAlign ="Center" CssClass ="GridPager" />
            <%--<FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right"/>
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />--%>

<RowStyle CssClass="rows"></RowStyle>

<SelectedRowStyle CssClass="selectedRows"></SelectedRowStyle>
        </asp:GridView>
        <br />
        <asp:Button ID="btnEvents" runat="server" CssClass="addEventBtn" Text="Add Events" OnClick="btnEvents_Click" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnBack" runat="server" CssClass="backEventBtn" Text="Back" OnClick="btnBack_Click" />
    </div>
    <div>
    </div>
    <div>
        <h2>
            &nbsp;</h2>
    </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body2" runat="server">
    <main>
        <div>
        </div>
    </main>
</asp:Content>
