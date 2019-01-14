<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="CalendarSelect.aspx.cs" Inherits="CampfirePlanner.ASP.Net.CalenderPages.calendarSelect.CalendarSelect" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CalendarSelect.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div>
        <table class="w-100">
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style2">
                    <p>
                        Please Select Start and End Date of Your Event
                    </p>
                    <p>
                        Name of Event:
                        <asp:TextBox ID="txtEvent" runat="server" AutoPostBack="True" AutoCompleteType="Disabled"></asp:TextBox>
                    </p>
                    <div class="row">
                        <asp:Calendar ID="calSelect" runat="server" BackColor="White" CssClass="calendarSelect" DayHeaderStyle-CssClass="header" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="287px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="357px" OnLoad="calSelect_Load" OnPreRender="calSelect_PreRender" OnSelectionChanged="calSelect_SelectionChanged">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                            <DayStyle Width="14%" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                            <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                            <TodayDayStyle BackColor="#CCCC99" />
                        </asp:Calendar>
                    </div>
                    Days:&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtDayz" runat="server" ReadOnly="True" Width="53px" Height="31px">0</asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RangeValidator ID="rvDayz" runat="server" ControlToValidate="txtDayz" CssClass="auto-style1" Display="Dynamic" ErrorMessage="Number of Days Cannot Exceed 7" MaximumValue="7" MinimumValue="1"></asp:RangeValidator>
                    &nbsp;<asp:RequiredFieldValidator ID="rfDayz" runat="server" ControlToValidate="txtEvent" CssClass="auto-style1" Display="Dynamic" ErrorMessage="Please Select At Least 1 Day"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text="Reset" CausesValidation="False" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCreate" runat="server" Height="33px" OnClick="btnCreate_Click" Text="Create" Width="85px" />
                    &nbsp;
                    <asp:RequiredFieldValidator ID="rfName" runat="server" ControlToValidate="txtEvent" CssClass="auto-style1" Display="Dynamic" ErrorMessage="Name of Event cannot be blank"></asp:RequiredFieldValidator>
                </td>
                <td visible="false" runat="server" id="tdList" class="auto-style4">

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    Search :&nbsp; <asp:TextBox ID="txtSearch" runat="server" AutoCompleteType="Disabled" AutoPostBack="True" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                    <br />
                    <br />
                    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" OnRowCommand="gvUsers_RowCommand" Width="384px">
                        <Columns>
                            <asp:BoundField DataField="AccountID" HeaderText="ID" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Height="20px" HorizontalAlign="Center" Width="30px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Username" HeaderText="Name" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:ButtonField ButtonType="Button" Text="Add" CommandName="addUser" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:ButtonField>
                        </Columns>
                    </asp:GridView>

                </td>
                <td visible="false" runat="server" id="tdList2">

                    Users Selected:
                    <asp:Label ID="lblCount" runat="server"></asp:Label>
                    <br />
                    <asp:ListBox ID="lbSelected" runat="server" AutoPostBack="True" Height="263px" OnSelectedIndexChanged="lbSelected_SelectedIndexChanged" Width="244px"></asp:ListBox>
                    <br />
                    <asp:Button ID="btnRemove" runat="server" OnClick="btnRemove_Click" Text="Remove" Visible="False" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />

                    <asp:Button ID="btnEventCreate" runat="server" CssClass="auto-style5" OnClick="btnEventCreate_Click" Text="Create Event" />

                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body3" runat="server">
    <p>
        &nbsp;
    </p>
</asp:Content>
