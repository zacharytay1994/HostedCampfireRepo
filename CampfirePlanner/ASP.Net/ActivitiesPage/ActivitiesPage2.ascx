<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ActivitiesPage2.ascx.cs" Inherits="CampfirePlanner.ASP.Net.ActivitiesPage.ActivitiesPage21" %>
<style>
    .activitybox {
        border:solid;
    }
</style>
<div class="activitybox">
    <asp:Label runat="server" ID="activityName"></asp:Label>
    <asp:Label runat="server" ID="activityDescripton"></asp:Label>
    <asp:Image ID="activityImage" runat="server" />
</div>