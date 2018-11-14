<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="CreateEvent.aspx.cs" Inherits="CampfirePlanner.ASP.Net.CreateEvent.CreateEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 style="text-align: center">Create Event
        </h1>
        <p>
            <asp:Calendar ID="calSelect" runat="server" BackColor="White" BorderColor="Black" Font-Names="Times New Roman" Font-Size="15pt" ForeColor="Black" Height="298px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="351px">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                <DayStyle Width="14%" />
                <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" Wrap="True" />
                <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                <TodayDayStyle BackColor="#CCCC99" />
            </asp:Calendar>
        </p>
        <br />
        <p style="text-align:center">
            <asp:Button ID="Button1" runat="server" Text="Edit Schedule" />
        </p>
    </div>
</asp:Content>
