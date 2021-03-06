﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavBar.ascx.cs" Inherits="CampfirePlannerPlanner.ASP.Net.MasterPages.MainNavBar.NavBar" %>
<style>
    .nav-item a {
        /*float: none;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        display:inline-block;*/
    }
    .nav-item:hover{
        background-color: ghostwhite;
    }
    .auto-style1 {
        width: 58px;
        height: 50px;
    }
</style>
<nav class="navbar navbar-expand-md navbar-light" style="background-color:#f27100; border-color:darkred; background-image: url('https://i.imgur.com/2eOeYmD.jpg'); background-size:cover;">
    <!-- The brand(or icon) of the navbar -->
    <a class="navbar-brand" href="/ASP.Net/HomePage/HomePage.aspx">
        <img src="../../../Images/campfire_logo.png" class="auto-style1" style="border:none;"/>
    </a>
    <!-- Toggle/collapsible Button, also known as hamburger button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navBar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <!-- Links in the navbar, displayed as drop-down list when collapsed -->
    <div class="collapse navbar-collapse" id="navBar" style="left:50%; position:absolute; transform: translate(-50%, -50%); margin-top: 20px;">
        <!-- Links that are aligned to the left, mr-auto: right margin auto-adjusted -->
        <ul class="navbar-nav mr-auto">
            <li class="nav-item" id="Planner">
                <a class="nav-link" href="/ASP.Net/CalenderPages/calendarEventMain/calendarEventMain.aspx" style="border-color:slategrey; font-family:'Bodoni MT'; color: black;">planner</a>
            </li>
            <li class="nav-item" id="Activites">
                <a class="nav-link" href="/ASP.Net/ActivitiesPage/ActivitiesPage.aspx" style="border-left:solid; border-color:slategrey; font-family:'Bodoni MT'; color: black;">activities</a>
            </li>
            <li class="nav-item" id="ActivityAdd">

                <a class="nav-link" href="/ASP.Net/ActivitiesPage/activityForm.aspx" style="border-left:solid; border-color:slategrey; font-family:'Bodoni MT'; color: black; ">add an activity</a>

            </li>
            <li class="nav-item" id="About">
                <a class="nav-link" href="#" style="border-left:solid; border-color:slategrey; font-family:'Bodoni MT'; color: black; ">about us</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item" id="Logout" runat="server">
                <%--<asp:Button ID="btnSignIn" runat="server" Text="Sign In" CssClass="btn btn-link nav-link" CausesValidation="False" OnClick="btnSignIn_Click" />--%>
                <a runat="server" onserverclick="logInOut" id="btnNavLogInOut" class="nav-link" style="border-left:solid; border-color:slategrey; font-family:'Bodoni MT'; color: black; ">log out</a>
            </li>
        </ul>
    </div>
</nav>
