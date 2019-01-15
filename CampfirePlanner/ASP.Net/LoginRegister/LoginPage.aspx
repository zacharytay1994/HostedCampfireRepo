<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="CampfirePlannerPlanner.ASP.Net.LoginRegister.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="LoginPage.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <section>
        <div><img src="../../Images/Logo_sm.png"/></div>
    </section>
    <table class="w-100" width="100%" border="0" style="border:none;">
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lbl_Email" runat="server" CssClass="auto-style9" Text="Email :"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtEmail" runat="server" Width="380px" cssclass="textbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style11"></td>
            <td class="auto-style12"></td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lbl_Password" runat="server" CssClass="auto-style9" Text="Password :"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtPw" runat="server" Width="380px" cssclass="textbox" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">
                &nbsp;</td>
            <td class="auto-style12">
                <asp:Label ID="lblMessage" runat="server" CssClass="auto-style18"></asp:Label>
            </td>
        </tr>
        </table>
    <p class="login"><asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" cssclass="loginbutton"/></p>
    <p class="hlink"><asp:HyperLink ID="HyperLink1" runat="server" CssClass="hypercss" NavigateUrl="RegisterPage.aspx">Don&#39;t have an account? Sign Up here!</asp:HyperLink></p>
</asp:Content>
