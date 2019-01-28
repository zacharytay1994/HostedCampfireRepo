<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="calenderViewDay.aspx.cs" Inherits="CampfirePlanner.ASP.Net.CalenderPages.calenderViewDay.calenderViewDay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="calenderViewDay.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <h2 style="margin-top:10px; width:95%; font-weight:bold;">Event Schedule Planner</h2>
    <table style="padding:10px;">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblProjName" runat="server" Text="PROJECT/EVENT:"><h2>Project/Event:</h2></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:Label ID="lblProjNameO" runat="server" Text="Label" CssClass="outputtext"></asp:Label>
            </td>
            <td class="auto-style2" rowspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblOrganizer" runat="server" Text="ORGANIZER:"><h2>Organizer:</h2></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:Label ID="lblOrganizerO" runat="server" Text="Label" CssClass="outputtext"></asp:Label>
            </td>
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
          <%--<asp:DataPager runat="server" ID="ContactsDataPager" PageSize="12">
            <Fields>
              <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowLastPageButton="true"
                FirstPageText="|&lt;&lt; " LastPageText=" &gt;&gt;|"
                NextPageText=" &gt; " PreviousPageText=" &lt; " />
            </Fields>
          </asp:DataPager>--%>
        </LayoutTemplate>
        <ItemTemplate>
          <tr runat="server">
            <td>
              <asp:Label ID="StartTime" runat="Server" Text='<%#Eval("StartTime") %>'/>
            </td>
            <td>
              <button id="actID" onclick="on()" type="button"><asp:Label ID="ActivityName" runat="Server" Text='<%#Eval("ActivityName") %>' /></button>
            </td>
            <td>
              <asp:Label ID="Duration" runat="Server" Text='<%#Eval("Duration") %>' />
            </td>
              <td>
              <asp:Label ID="Description" runat="Server" Text='<%#Eval("ActivityDesc") %>' />
            </td>
          </tr>
        </ItemTemplate>
    </asp:ListView>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <div id="overlay" onclick="off()">
        <div>
            <h2 id="actName" ></h2>
            <div>
                <p style=""><b>Time-line</b></p>
                <h1 style="text-align:left; color:white">[Start Time]</h1>
                <p style="border-bottom:solid; border-color:white; color:white; text-align:center">Click on timeline to add ++</p>
                <h1 style="text-align:right; color:white">[End Time]</h1>
            </div>
        </div>
    </div>
    <button onclick="on()" type="button">Click me test</button>
    <script>
        function displayOverlay() {

        }
        function on() {
            document.getElementById("overlay").style.display = "block";
            document.getElementById("actName").innerHTML =
                document.getElementById("actID").innerHTML;
        }

        function off() {
            document.getElementById("overlay").style.display = "none";
        }
    </script>
</asp:Content>