<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="CalendarSelect.aspx.cs" Inherits="CampfirePlanner.ASP.Net.CalenderPages.calendarSelect.CalendarSelect" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div>
        <p>
            Please Select Start and End Date of Your Event
        </p>
        <p>

            Name of Event:
            <asp:TextBox ID="txtEvent" runat="server"></asp:TextBox>

        </p>
        <div class="row">
        <asp:calendar id="calSelect" runat="server" backcolor="White" bordercolor="Black" daynameformat="Shortest" font-names="Times New Roman" font-size="10pt" forecolor="Black" height="287px" nextprevformat="FullMonth" titleformat="Month" width="357px" onload="calSelect_Load" onprerender="calSelect_PreRender" onselectionchanged="calSelect_SelectionChanged">
        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
        <DayStyle Width="14%" />
        <NextPrevStyle Font-Size="8pt" ForeColor="White" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
        <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
        <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
        <TodayDayStyle BackColor="#CCCC99" />
    </asp:calendar>
            <table>
                <tr>
                    <td>asasasas</td>
                </tr>
            </table>
        </div>

        Days:&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:textbox id="txtDayz" runat="server" readonly="True" width="53px" Height="31px"></asp:textbox>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:rangevalidator id="rvDayz" runat="server" controltovalidate="txtDayz" cssclass="auto-style1" display="Dynamic" errormessage="Number of Days Cannot Exceed 7" maximumvalue="7" minimumvalue="1"></asp:rangevalidator>
        <asp:RequiredFieldValidator ID="rfDayz" runat="server" ControlToValidate="txtEvent" CssClass="auto-style1" Display="Dynamic" ErrorMessage="Please Select At Least 1 Day"></asp:RequiredFieldValidator>
        <br />
        <asp:button id="btnReset" runat="server" onclick="btnReset_Click" text="Reset" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:button id="btnEvent" runat="server" height="38px" onclick="btnEvent_Click" text="Add Event" width="118px" />
    &nbsp;
        <asp:RequiredFieldValidator ID="rfName" runat="server" ControlToValidate="txtEvent" CssClass="auto-style1" Display="Dynamic" ErrorMessage="Name of Event cannot be blank"></asp:RequiredFieldValidator>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body2" runat="server">
    <p>
        &nbsp;</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body3" runat="server">
    <p>
        &nbsp;</p>
</asp:Content>
