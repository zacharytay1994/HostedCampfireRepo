<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="calenderViewDay.aspx.cs" Inherits="CampfirePlanner.ASP.Net.CalenderPages.calenderViewDay.calenderViewDay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="calenderViewDay.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div id="clickerTitles" style="text-align:center;">
        <div class="selectTitle" id="actCat"">
            <h3 style="width:95%; font-weight:bold;">Event Schedule Planner</h3>
        </div>
    </div>
    <div class="aniContainer" id="actCatDiv">
        <br />
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
              <th class="fkingheader" runat="server">Time</th>
              <th class="fkingheader" runat="server">Activity</th>
              <th class="fkingheader" runat="server">Duration</th>
              <th class="fkingheader" runat="server">Description</th>
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
            <td class="fkingbox" style="background-color:rgba(255,0,0,0.3);">
              <asp:Label ID="StartTime" runat="Server" Text='<%#Eval("StartTime") %>'/>
            </td>
            <td class="fkingbox">
              <div id="actID" onClick="on()"><asp:Label ID="ActivityName" runat="Server" Text='<%#Eval("ActivityName") %>' /></div>
            </td>
            <td class="fkingbox">
              <asp:Label ID="Duration" runat="Server" Text='<%#Eval("Duration") %>' />
            </td>
              <td class="fkingbox">
              <asp:Label ID="Description" runat="Server" Text='<%#Eval("ActivityDesc") %>' />
            </td>
          </tr>
        </ItemTemplate>
    </asp:ListView>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <asp:Button ID="btnBack" runat="server" CssClass="backViewBtn" Text="Back" OnClick="btnBack_Click" />
    <div id="overlay" onclick="off()">
        <div>
            <h2 id="actName" ></h2>
            <div>
                <p style="color:white; text-align:center"><b>Timeline</b></p>
                <h1 style="text-align:left; color:white">[9.00 AM]</h1>
                <p style="border-bottom:solid; border-color:white; color:white; text-align:center">Click on timeline to add ++</p>
                <h1 style="text-align:right; color:white">[9.45 AM]</h1>
                <div class="timeDis" style="left:10%">
                    <p style="font-family:Georgia; font-weight:bold;"><u>9.05</u></p>
                    Fetch students from attrium.
                </div>
                <div class="timeDis" style="left:50%">
                    <p style="font-family:Georgia; font-weight:bold;"><u>9.25</u></p>
                    Prize giving ceremony.
                </div>
            </div>
        </div>
    </div>
    </div>
    <script type="text/javascript">
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
    <script>
        function displayActCat() {
            document.getElementById("actCatDiv").style.display = "block";
            document.getElementById("clickerTitles").style.animationName = "pushup";
            document.getElementById("trigger").style.animationName = "pushuptrigger";
        }
        function displayFeatCat() {
            document.getElementById("featCatDiv").style.display = "block";
            document.getElementById("clickerTitles").style.animationName = "pushup";
            document.getElementById("trigger").style.animationName = "pushuptrigger";
        }
        function hideActCat() {
            document.getElementById("actCatDiv").style.display = "none";
        }
        function hideFeatCat() {
            document.getElementById("featCatDiv").style.display = "none";
        }
        function hideAll() {
            document.getElementById("actCatDiv").style.display = "none";
            document.getElementById("featCatDiv").style.display = "none";
            document.getElementById("clickerTitles").style.animationName = "pushdown";
            document.getElementById("trigger").style.animationName = "pushdowntrigger";
        }
    </script>
</asp:Content>