<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="ActivityDesc.aspx.cs" Inherits="CampfirePlanner.ASP.Net.ActivitiesPage.ActivityDesc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            width: 469px;
        }
        .auto-style2 {
            height: 38px;
        }
        .auto-style3 {
            text-align: left;
            height: 38px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="w-100">
        <tr>
            <td class="auto-style1" rowspan="5">
                Slideshow Thingy Here</td>
            <td class="auto-style2">
                <asp:Label ID="lblTitle" runat="server"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:PlaceHolder runat="server" ID="topRight" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblDuration" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblDesc" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="2">
                <asp:Label ID="lblLinks" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Votes Displayed Here</td>
            <td colspan="2">
                <asp:Label ID="lblCategories" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="text-left" colspan="3">
                <asp:Label ID="lblExp" runat="server"></asp:Label>
                Activity ID =
                <asp:Label ID="lbl_activityid" runat="server" Text="ActivityId"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="3"></td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="3">Comments</td>
        </tr>
        <tr>
            <td class="text-left" colspan="3">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
