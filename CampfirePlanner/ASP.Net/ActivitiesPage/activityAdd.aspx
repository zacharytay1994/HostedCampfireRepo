<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activityAdd.aspx.cs" Inherits="CampfirePlanner.ASP.Net.ActivitiesPage.activityAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Add Activity</title>
    <link rel="stylesheet" href="~/ASP.Net/ActivitiesPage/Css/activityForm.css"/>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:Extra-Bold" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet"/>
</head>
<body>
    <main>
        <h1 style="font-size:150px" class="border">Add Activity</h1>
        <div id="activities">
            <form id="activitiesForm" runat="server">
                <div class="row">
                    <div class="col-25">
                        <label for="activityName">Name of Game</label>
                    </div>
                    <div class="col-75">
                        <asp:TextBox ID="activityName" runat="server" placeholder="The name of the game!" CssClass="textbox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Please Specify a Name!" ControlToValidate="activityName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="briefDescription">Brief Description</label>
                    </div>
                    <div class="col-75">
                        <asp:TextBox ID="briefDescription" runat="server" placeholder="Just a sentence is fine!" CssClass="textbox"></asp:TextBox>
                        <asp:Label ID="lblDescription" runat="server" Text="Example: &quot;A game that requires you to think on your feet!&quot;" ForeColor="Orange"></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ErrorMessage="Please add a Brief Description!" ControlToValidate="briefDescription" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="category">Category of Game</label>
                    </div>
                    <div class="col-75">
                        <asp:ListBox ID="lbCat" runat="server" SelectionMode="Multiple" AutoPostBack="True">
                        <asp:ListItem Value="a">Action</asp:ListItem>
                        <asp:ListItem Value="b">Adventure</asp:ListItem>
                        <asp:ListItem Value="c">Rhythm</asp:ListItem>
                        <asp:ListItem Value="d">IceBreaker</asp:ListItem>
                        </asp:ListBox>
                        <asp:Label ID="lblCat" runat="server" Text="Hold Ctrl + Click to Select Multiple Categories" ForeColor="Orange"></asp:Label> <br />
                        <asp:RequiredFieldValidator ID="rfvCat" runat="server" ErrorMessage="Please Select at least One Category!" Display="Dynamic" ForeColor="Red" ControlToValidate="lbCat"></asp:RequiredFieldValidator>
&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="Duration">Approximate Duration</label>
                    </div>
                    <div class="col-75">
                        <asp:TextBox ID="txtDuration" type="number" step="1" min="1" max="120" runat="server" placeholder="Minutes"></asp:TextBox> <br \ />
                        <asp:Label ID="Label1" runat="server" Text="Values from 1 to 120 minutes"></asp:Label>
&nbsp;<br />
                        <asp:RequiredFieldValidator ID="rfvDuration" runat="server" ControlToValidate="txtDuration" ErrorMessage="Please enter a duration!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator> <br \ />
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="explanation">Explanation of Game</label>
                    </div>
                    <div class="col-75">
                        <asp:TextBox id="txtExplanation" TextMode="multiline" Columns="50" Rows="15" runat="server" CssClass="textbox" />
                        <asp:Label ID="lblExplain" runat="server" Text="Tell us about the rules and materials required!"></asp:Label>
&nbsp;<br />
                        <asp:RequiredFieldValidator ID="rfvExplain" runat="server" ControlToValidate="activityName" ErrorMessage="Please provide an Explanation!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="links">Links</label>
                    </div>
                    <div class="col-75">
                        <asp:TextBox ID="txtLinks" runat="server" CssClass="textbox"></asp:TextBox>
                    <asp:Label ID="lblLinks" runat="server"></asp:Label><br />
                        <asp:RegularExpressionValidator ID="revLinks" runat="server" ErrorMessage="Please use a Valid URL!" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" ControlToValidate="txtLinks" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="uploadPhoto">Upload Photos</label>
                    </div>
                    <div class="col-75">
                        <asp:FileUpload ID="upPhoto" runat="server" />
                    </div>
                    <asp:Label ID="lblPhoto" runat="server"></asp:Label>
                </div>
                <div class="row">
                    <asp:Button ID="submitForm" runat="server" Text="Submit" OnClick="submitForm_Click" />
                    <asp:Button ID="returnHome" runat="server" Text="Return to Main Menu" CausesValidation="False" OnClick="returnHome_Click" />
                </div>
            </form>
        </div>
    </main>
</body>
</html>