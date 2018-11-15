<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="calendarEventMain.aspx.cs" Inherits="CampfirePlanner.ASP.Net.CalenderPages.calendarEventMain.calendarEventMain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 188px;
        }
        .auto-style2 {
            width: 394px;
            height: 139px;
        }
        .auto-style3 {
            height: 139px;
            font-family: "Segoe UI";
            font-weight: bold;
            font-size: x-large;
        }
        .auto-style4 {
            width: 394px;
        }
        .auto-style5 {
            width: 188px;
            height: 35px;
        }
        .auto-style6 {
            width: 394px;
            height: 35px;
        }
        .auto-style7 {
            height: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body2" runat="server">
    <p>
        <table class="w-100">
            <tr>
                <td class="auto-style1"></td>
                <td class="auto-style2">
                    <asp:Label ID="lblWelcome" runat="server" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                </td>
                <td class="auto-style3">Current Events</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style4">
                    <asp:GridView ID="GridView1" runat="server">
                    </asp:GridView>
                </td>
                <td>
                    <asp:GridView ID="gvEvents" runat="server" EmptyDataText="There are no Events!" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="EventID" HeaderText="Event ID" />
                            <asp:BoundField DataField="StartDate" DataFormatString="{0:MM-dd-yyyy}" HeaderText="Start Date" />
                            <asp:BoundField DataField="EndDate" DataFormatString="{0:MM-dd-yyyy}" HeaderText="End Date" />
                            <asp:BoundField DataField="EventName" HeaderText="Event Name" />
                            <asp:ButtonField CommandName="Select" Text="Collaborators" />
                            <asp:HyperLinkField DataNavigateUrlFields="EventID" DataNavigateUrlFormatString="../calenderViewDay/calenderViewDay.aspx?eventID={0}" Text="View" />
                            <asp:HyperLinkField DataNavigateUrlFields="EventID" DataNavigateUrlFormatString="../calenderRecommend/calenderRecommend.aspx?eventID={0}" Text="Add Activity" />
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
                </td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style7">
                    <asp:Button ID="btnEvents" runat="server" Text="Add Events" OnClick="btnEvents_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body3" runat="server">
</asp:Content>
