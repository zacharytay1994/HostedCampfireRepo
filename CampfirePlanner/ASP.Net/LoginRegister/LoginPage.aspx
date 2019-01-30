<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="CampfirePlannerPlanner.ASP.Net.LoginRegister.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="LoginPage.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .auto-style15 {
        width: 100%;
        margin-right: 0px;
        height: 174px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div class="loginform">
        
        <table class="auto-style15" border="0" style="border:none;">
            <tr>
                <th class="inputboxthree">
                    <asp:Image ID="topPic" runat="server" CssClass="top-pic" ImageUrl="../../Images/login_logo.png"/>
                </th>
            </tr>
            <tr>
                <td class="inputboxone">
                    <asp:TextBox ID="txtEmail" style="padding-left: 40px;" runat="server" Width="413px" cssclass="emailtb" placeholder="Email" Height="44px"></asp:TextBox>
                </td>
            </tr>
            <tr>
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
