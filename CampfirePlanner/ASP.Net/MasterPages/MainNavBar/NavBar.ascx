<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavBar.ascx.cs" Inherits="CampfirePlannerPlanner.ASP.Net.MasterPages.MainNavBar.NavBar" %>
<style>
    a:hover{
        background-color: lightblue;
    }
</style>
<nav class="navbar navbar-expand-md navbar-light" style="background-color:lightskyblue; border-bottom:solid; border-color:darkblue">
    <!-- The brand(or icon) of the navbar -->
    <a class="navbar-brand" href="/ASP.Net/HomePage/HomePage.aspx" style="font-size: 32px; font-weight: bold; color: salmon; font-family:Garamond;">CampfirePlanner
    </a>
    <!-- Toggle/collapsible Button, also known as hamburger button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navBar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <!-- Links in the navbar, displayed as drop-down list when collapsed -->
    <div class="collapse navbar-collapse" id="navBar">
        <!-- Links that are aligned to the left, mr-auto: right margin auto-adjusted -->
        <ul class="navbar-nav mr-auto">
            <li class="nav-item" id="Planner">
                <a class="nav-link" href="/ASP.Net/CalenderPages/calendarEventMain/calendarEventMain.aspx" style="border-left:solid; border-color:dodgerblue; font-family:'Bodoni MT'; color: black;">Planner</a>
            </li>
            <li class="nav-item" id="Activites">
                <a class="nav-link" href="/ASP.Net/ActivitiesPage/ActivitiesPage.aspx" style="border-left:solid; border-color:dodgerblue; font-family:'Bodoni MT'; color: black;">Activities</a>
            </li>
            <li class="nav-item" id="About">
                <a class="nav-link" href="#" style="border-left:solid; border-color:dodgerblue; font-family:'Bodoni MT'; color: black; ">About Us</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item" id="Logout" runat="server">
                <%--<asp:Button ID="btnSignIn" runat="server" Text="Sign In" CssClass="btn btn-link nav-link" CausesValidation="False" OnClick="btnSignIn_Click" />--%>
                <a runat="server" onserverclick="logInOut" id="btnNavLogInOut" class="nav-link" style="border-left:solid; border-color:dodgerblue; font-family:'Bodoni MT'; color: black; ">Log Out</a>
            </li>
        </ul>
    </div>
</nav>
