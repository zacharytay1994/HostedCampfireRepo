<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavBar.ascx.cs" Inherits="CampfirePlanner.ASP.Net.MasterPages.MainNavBar.NavBar" %>
<nav class="navbar navbar-expand-md bg-light navbar-light">
    <!-- The brand(or icon) of the navbar -->
    <a class="navbar-brand" href="#" style="font-size: 32px; font-weight: bold; color: red;">Campfire
    </a>
    <!-- Toggle/collapsible Button, also known as hamburger button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navBar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <!-- Links in the navbar, displayed as drop-down list when collapsed -->
    <div class="collapse navbar-collapse" id="navBar">
        <!-- Links that are aligned to the left, mr-auto: right margin auto-adjusted -->
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="#">Planner</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Activities</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">About Us</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <%--<asp:Button ID="btnSignIn" runat="server" Text="Sign In" CssClass="btn btn-link nav-link" CausesValidation="False" OnClick="btnSignIn_Click" />--%>
            </li>
        </ul>
    </div>
</nav>
