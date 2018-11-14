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
        .auto-style4 {
            color: #FFFFFF;
            background-color: #FF3300;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body2" runat="server">
    <table class="w-100">
        <tr>
            <td class="auto-style1" rowspan="5">Slideshow Thingy Here</td>
            <td class="auto-style2">
                <asp:label id="lblTitle" runat="server"></asp:label>
            </td>
            <td class="auto-style2">
                <asp:Button ID="btnDel" runat="server" CssClass="auto-style4" Height="44px" OnClick="btnDel_Click" Text="Delete Activity" Visible="False" Width="170px" OnClientClick="return confirm('Are You Sure?')" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:label id="lblDuration" runat="server"></asp:label>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:label id="lblDesc" runat="server"></asp:label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="2">
                <asp:label id="lblLinks" runat="server"></asp:label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Votes Displayed Here</td>
            <td colspan="2">
                <asp:label id="lblCategories" runat="server"></asp:label>
            </td>
        </tr>
        <tr>
            <td class="text-left" colspan="3">
                <asp:label id="lblExp" runat="server"></asp:label>
                Activity ID =
                <asp:label id="lbl_activityid" runat="server" text="ActivityId"></asp:label>
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
