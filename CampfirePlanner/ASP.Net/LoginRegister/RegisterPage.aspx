<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="CampfirePlannerPlanner.ASP.Net.LoginRegister.RegisterPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="~/Scripts/jquery.validate.unobtrusive.js"></script>
    <link href="RegisterPage.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <p class="registerheader"><span class="regi-pic"><img src="../../Images/loginpic.png" /></span></p>

    <table class="w-100" border="0" style="border:none;">
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lbl_username" runat="server" Text="Username" CssClass="auto-style9"></asp:Label>
                </td>
            <td class="auto-style4">
                <asp:TextBox ID="tb_username" runat="server" cssclass="textbox" Width="380px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style11"></td>
            <td class="auto-style12"><p>
                <asp:RequiredFieldValidator ID="rfv_username" runat="server" ControlToValidate="tb_username" ErrorMessage="Please Enter A Valid Username">Please choose a display Username</asp:RequiredFieldValidator>
                </p></td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lbl_email" runat="server" Text="Email Address" CssClass="auto-style9"></asp:Label>
                :</td>
            <td class="auto-style4">
                <input type="email" runat="server" id="email_Email" style="border-radius:5px;" class="auto-style10"/>
            </td>
        </tr>
        <tr>
            <td class="auto-style11"></td>
            <td class="auto-style12"><p>
                <asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="email_Email" ErrorMessage="RequiredFieldValidator">Please enter a valid Email Address</asp:RequiredFieldValidator>
                </p></td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lbl_password" runat="server" Text="Enter Password" CssClass="auto-style9"></asp:Label>
                :</td>
            <td class="auto-style4">
                <asp:TextBox ID="tb_password" runat="server" cssclass="textbox" Width="380px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style11"></td>
            <td class="auto-style12"><p>
                <asp:RequiredFieldValidator ID="rfv_password" runat="server" ControlToValidate="tb_password" ErrorMessage="Please Input A Valid Password">Please enter password</asp:RequiredFieldValidator>
                </p></td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lbl_password2" runat="server" Text="Re-Enter Password" CssClass="auto-style9"></asp:Label>
                :</td>
            <td class="auto-style4">
                <asp:TextBox ID="tb_password2" runat="server" cssclass="textbox" Width="380px"></asp:TextBox>
                <asp:CompareValidator ID="cv_password2" runat="server" ControlToCompare="tb_password" ControlToValidate="tb_password2" ErrorMessage="Passwords Do Not Match"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style11"></td>
            <td class="auto-style12"><p>
                <asp:RequiredFieldValidator ID="rfv_password2" runat="server" ControlToValidate="tb_password2" ErrorMessage="Please Re-Enter Password">Please re-enter password</asp:RequiredFieldValidator>
                </p></td>
        </tr>
    </table>

    <p class="submit"><asp:Button ID="btn_submit" runat="server" Text="Register" OnClick="btn_submit_Click" cssclass="submitbutton"/></p>
</asp:Content>
