<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="CampfirePlannerPlanner.ASP.Net.LoginRegister.RegisterPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="~/Scripts/jquery.validate.unobtrusive.js"></script>
    <link href="RegisterPage.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style13 {
            width: 380px;
            height: 44px;
        }
        .auto-style14 {
            height: 30px;
            width: 205px;
            color: white;
        }
        .auto-style15 {
            height: 20px;
            width: 205px;
        }
        .auto-style16 {
            height: 30px;
            width: 335px;
        }
        .auto-style17 {
            height: 20px;
            width: 335px;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <p class="regi-pic"><span class="registerheader"><img src="../../Images/loginpic.png" /></span></p>

    <table class="w-100" border="0" style="border:none;">
        <tr>
            <td class="auto-style14">
                &nbsp;</td>
            <td class="auto-style16">
                <asp:TextBox ID="tb_username" runat="server" cssclass="textbox" Width="380px" Height="44px" placeholder="Enter Username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_username" runat="server" ControlToValidate="tb_username" ErrorMessage="Please Enter A Valid Username">Please choose a display Username</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style14">
                &nbsp;</td>
            <td class="auto-style16">
                <input type="email" runat="server" id="email_Email" style="background-color: rgba(0, 0, 0, 0.7); border: none; color: white; margin-bottom: 20px; padding: 7px;" class="auto-style13" placeholder="Enter Email"/>
                <asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="email_Email" ErrorMessage="RequiredFieldValidator">Please enter a valid Email Address</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style14">
                &nbsp;</td>
            <td class="auto-style16">
                <asp:TextBox ID="tb_password" runat="server" cssclass="textbox" Width="380px" Height="44px" placeholder="Enter Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_password" runat="server" ControlToValidate="tb_password" ErrorMessage="Please Input A Valid Password">Please enter password</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style14">
                &nbsp;</td>
            <td class="auto-style16">
                <asp:TextBox ID="tb_password2" runat="server" cssclass="textbox" Width="380px" Height="44px" placeholder="Re-enter Password"></asp:TextBox>
                <asp:CompareValidator ID="cv_password2" runat="server" ControlToCompare="tb_password" ControlToValidate="tb_password2" ErrorMessage="Passwords Do Not Match"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="rfv_password2" runat="server" ControlToValidate="tb_password2" ErrorMessage="Please Re-Enter Password">Please re-enter password</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15"></td>
            <td class="auto-style17"><p>
                &nbsp;</p></td>
        </tr>
    </table>

    <p class="submit"><asp:Button ID="btn_submit" runat="server" Text="Register" OnClick="btn_submit_Click" cssclass="submitbutton"/></p>
</asp:Content>
