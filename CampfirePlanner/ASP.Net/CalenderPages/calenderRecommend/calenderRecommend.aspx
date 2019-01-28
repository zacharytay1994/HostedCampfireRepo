<%@ Page Title="Recommendation" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="calenderRecommend.aspx.cs" Inherits="CampfirePlanner.ASP.Net.CalenderPages.calenderRecommend" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:Extra-Bold" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet"/>
    <link href="calenderRecommend.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    &nbsp;
    <main>
        <h2 style="font-family:Georgia; font-weight:bold; border-left:solid; border-bottom:solid; border-left-width:20px; padding-left:10px; padding-bottom:10px; border-color: dodgerblue; width:90%; margin-left:5%;">Scheduler</h2>
        <div>
                <div class="titles" style="top:45%">
                    <div>
                        <h2 style="font-family:Georgia; border-left:solid; border-bottom:solid; border-left-width:20px; padding-left:10px; padding-bottom:10px; border-color: dodgerblue; width:90%">Select Day</h2>
                    </div>
                    <div>
                        <asp:RadioButtonList ID="rblDay" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rblDay_SelectedIndexChanged"></asp:RadioButtonList>                
                        <asp:Label ID="lblDay" runat="server"></asp:Label>
                    </div>
                </div>

                <div class="titles" style="top:70%; left:15%">
                    <div style="display:inline-block;">
                        <h2 style="font-family:Georgia; border-left:solid; border-bottom:solid; border-left-width:20px; padding-left:10px; padding-bottom:10px; border-color: dodgerblue; width:90%">Start Time</h2>
                    </div>
                    <div style="display:inline;">
                        <asp:TextBox ID="txtStart" type="time" runat="server"></asp:TextBox>
                        <asp:Label ID="lblStart" runat="server"></asp:Label>
                    </div>
                </div>

                <div class="titles" style="top:90%; left:20%">
                    <div style="display:inline-block;">
                         <h2 style="font-family:Georgia; border-left:solid; border-bottom:solid; border-left-width:20px; padding-left:10px; padding-bottom:10px; border-color: dodgerblue; width:90%">End Time</h2>
                    </div>
                    <div style="display:inline-block;">
                        <asp:TextBox ID="txtEnd" type="time" runat="server"></asp:TextBox>
                        <asp:Label ID="lblEnd" runat="server"></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvTime" runat="server" ControlToValidate="txtStart" Display="Dynamic" ErrorMessage="Please give us the intended times of activity!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblValidTime" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                </div>

                <div class="fronts" style="top:45%; left:60%">
                    <div class="recbuttons">
                        <asp:Button ID="btnRecommendation" class="buttonStyle" runat="server" OnClick="btnRecommendation_Click" Text="Get Recommendations" Width="176px" />
                    </div>
                </div>
                <%--&nbsp;&nbsp;--%>
                <div class="fronts" style="top:55%; left:60%">
                        <asp:Label ID="lblActivity" runat="server"></asp:Label>
                        <br />
                        <asp:GridView ID="gvRecommendation" runat="server" EmptyDataText="There are no activities!" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowPaging="True" OnPageIndexChanging="gvRecommendation_PageIndexChanging" PageSize="5" OnSelectedIndexChanged="gvRecommendation_SelectedIndexChanged" OnSelectedIndexChanging="gvRecommendation_SelectedIndexChanging" Width="645px" HorizontalAlign="Center">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                        <asp:BoundField DataField="ActivityID" HeaderText="ID" />
                        <asp:BoundField HeaderText="Name" DataField="ActivityName" />
                        <asp:BoundField HeaderText="Category" DataField="CategoryID" />
                        <asp:BoundField HeaderText="Duration" DataField="Duration" />
                        <asp:ButtonField Text="Select" CommandName="Select" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                        </asp:GridView>
                        <br />
                <asp:Label ID="lblGrid" runat="server"></asp:Label>
                <asp:Label ID="lblAdd" runat="server" Visible="False"></asp:Label>
                </div>

                <div class="fronts" style="top:95%">
                    <div class="col-25">

                    </div>
                    <div class="titles" style="top:45%; left:75%">
                    <asp:Button ID="btnReturn" class="buttonStyle" runat="server" Text="Return to Event Page" CausesValidation="False" OnClick="btnReturn_Click" />
                    <asp:Button ID="btnAdd" class="buttonStyle" runat="server" Text="Add" OnClick="btnAdd_Click" />
                    </div>
                </div>

                <div class="fronts">
                    <div class="col-25">

                    </div>
                    <div class="col-75">

                    </div>
                </div>
        </div>
    </main>
</asp:Content>
