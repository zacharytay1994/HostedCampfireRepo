<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="calenderViewDay.aspx.cs" Inherits="CampfirePlanner.ASP.Net.CalenderPages.calenderViewDay.calenderViewDay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 64px;
        }
        .auto-style2 {
            height: 62px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <table class="w-100">
        <tr>
            <td class="auto-style2" colspan="2">
                <asp:Label ID="PageTitle" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblProjName" runat="server" Text="PROJECT/EVENT"></asp:Label>
            </td>
            <td class="auto-style2">
                &nbsp;</td>
            <td class="auto-style2" rowspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblOrganizer" runat="server" Text="ORGANIZER"></asp:Label>
            </td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
    <asp:ListView ID="testview" runat="server"  DataKeyNames="ActivityID">
          <LayoutTemplate>
          <table cellpadding="2" width="640px" border="1" runat="server" id="tblProducts">
            <tr runat="server">
              <th runat="server">Time</th>
              <th runat="server">Activity</th>
              <th runat="server">Duration</th>
              <th runat="server">Description</th>
            </tr>
            <tr runat="server" id="itemPlaceholder" />
          </table>
          <asp:DataPager runat="server" ID="ContactsDataPager" PageSize="12">
            <Fields>
              <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowLastPageButton="true"
                FirstPageText="|&lt;&lt; " LastPageText=" &gt;&gt;|"
                NextPageText=" &gt; " PreviousPageText=" &lt; " />
            </Fields>
          </asp:DataPager>
        </LayoutTemplate>
        <ItemTemplate>
          <tr runat="server">
            <td>
              <asp:Label ID="StartTime" runat="Server" Text='<%#Eval("StartTime") %>'/>
            </td>
            <td>
              <asp:Label ID="ActivityName" runat="Server" Text='<%#Eval("ActivityName") %>' />
            </td>
            <td valign="top">
              <asp:Label ID="Duration" runat="Server" Text='<%#Eval("Duration") %>' />
            </td>
              <td>
              <asp:Label ID="Description" runat="Server" Text='<%#Eval("ActivityDesc") %>' />
            </td>
          </tr>
        </ItemTemplate>
        <EditItemTemplate>
          <tr style="background-color: #ADD8E6">
            <td>
              <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />&nbsp;
              <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </td>
            <td>
              <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%#Bind("FirstName") %>' 
                MaxLength="50" /><br />
            </td>
            <td>
              <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%#Bind("LastName") %>' 
                MaxLength="50" /><br />
            </td>
          </tr>
        </EditItemTemplate>
    </asp:ListView>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <asp:DropDownList ID="ddl1" runat="server"></asp:DropDownList>
    <asp:Table ID="Table1" runat="server">
        </asp:Table>
     
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body3" runat="server">
</asp:Content>
