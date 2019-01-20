<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="CampfirePlannerPlanner.ASP.Net.LoginRegister.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="LoginPage.css" rel="stylesheet" type="text/css" />
<%--<style type="text/css">
    .auto-style13 {
        width: 300px;
        height: 30px;
    }
    .auto-style14 {
        height: 40px;
        width: 300px;
    }
    .auto-style15 {
        width: 100%;
        margin-right: 0px;
        height: 174px;
    }
    .auto-style16 {
        height: 30px;
        width: 205px;
        color: white;
        text-align: right;
    }
    .auto-style17 {
        height: 40px;
        width: 205px;
    }
    .auto-style18 {
        /*border-radius: 5px;*/
        border-style: none;
        border-color: inherit;
        border-width: medium;
        color: white;
        margin-bottom: 20px;
        margin-left: 0;
    }
</style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div class="loginform">
        <div class="top-pic"><span><img src="../../Images/loginpic.png" /></span></div>
        <table class="auto-style15" border="0" style="border:none;">
            <tr>
                <td class="inputbox">
                </td>
                <td class="inputboxone">
                    <asp:TextBox ID="txtEmail" style="padding-left: 40px;" runat="server" Width="413px" cssclass="emailtb" placeholder="Email" Height="44px"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="inputbox"></td>
                <td class="inputboxtwo">
                    <asp:TextBox ID="txtPw" style="padding-left: 40px;" runat="server" Width="413px" cssclass="pwtb" TextMode="Password" placeholder="********" Height="44px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style17">
                    &nbsp;</td>
                <td class="auto-style14">
                    <asp:Label ID="lblMessage" runat="server" CssClass="auto-style18"></asp:Label>
                </td>
            </tr>
            </table>
        </div>
    <p class="loginbutton"><asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" cssclass="loginbutton"/></p>
    <p class="hlink"><asp:HyperLink ID="HyperLink1" runat="server" CssClass="hypercss" NavigateUrl="RegisterPage.aspx">Don&#39;t have an account? Sign Up here!</asp:HyperLink></p>
</asp:Content>
