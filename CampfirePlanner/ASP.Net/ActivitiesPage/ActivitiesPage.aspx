<%@ Page Title="" Language="C#" MasterPageFile="~/Campfire.Master" AutoEventWireup="true" CodeBehind="ActivitiesPage.aspx.cs" Inherits="Campfire.ActivitiesPage.ActivitiesPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="ActivitiesPage_ss.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField runat="server" ID="SendA" Value="1" />
    <script>
       document.getElementById("<%=SendA.ClientID%>").Value = "3";
    </script>
    <script type="text/javascript">
        function redirect(item) {
            var parse;
            switch (item){
                case "4":
                    parse = <%= Label4Update()%>;
                    break;
                case "8":
                    parse = <%= Label8Update()%>;
                    break;
                case "12":
                    parse = <%= Label12Update()%>;
                    break;
                case "16":
                    parse = <%= Label16Update()%>;
                    break;
                case "20":
                    parse = <%= Label20Update()%>;
                    break;
                case "24":
                    parse = <%= Label24Update()%>;
                    break;
                case "28":
                    parse = <%= Label28Update()%>;
                    break;
                case "32":
                    parse = <%= Label32Update()%>;
                    break;
            }
            //var parse =<%= Label4Update()%>;
             //Call .cs function
            window.location = '../ActivityDesc/ActivityDesc.aspx' + '?actID=' + parse;
            return false; //Redirect
        }
    </script>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center">Features Item Here</h1>
            </div>
        </div>
    </div>
    <div class="container">

        <asp:CheckBoxList ID="cbl_categories" runat="server" OnSelectedIndexChanged="cbl_categories_SelectedIndexChanged" RepeatDirection="Horizontal" AutoPostBack="True">
            <asp:ListItem Value="a">CategoryOne</asp:ListItem>
            <asp:ListItem Value="b">CategoryTwo</asp:ListItem>
            <asp:ListItem Value="c">CategoryThree</asp:ListItem>
            <asp:ListItem Value="d">CategoryFour</asp:ListItem>
        </asp:CheckBoxList>
        &nbsp;Please Select Categories to Display<br />

    </div>
    <div class="container">
        <div class="row">
            <div onclick="redirect(this.id)" class="col-md-3" id="4">
                <table style="width:100%">            
                    <tr>
                        <td>Name:</td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="lbl_1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="lbl_2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Category:</td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="lbl_3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>ID:</td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="1"></asp:Label>
                        </td>
                    </tr>
                </table>
                <%--<asp:Button runat="server" width="100%" ID="Button0" OnClick="Button0_Click" Text="Let's GO!" />--%>
            </div>
            <div onclick="redirect(this.id)" class="col-md-3" id="8">
                <table style="width:100%">
                    <tr>
                        <td>Name:</td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="lbl_1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="lbl_2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Category:</td>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="lbl_3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>ID:</td>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="2"></asp:Label>
                        </td>
                    </tr>
                </table>
                <%--<asp:Button runat="server" width="100%" ID="Button1" onclick="Button1_Click" Text="Let's GO!" />--%>
            </div>
             <div onclick="redirect(this.id)" class="col-md-3" id="12">
                <table style="width:100%">
                    <tr>
                        <td>Name:</td>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="lbl_1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td>
                            <asp:Label ID="Label10" runat="server" Text="lbl_2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Category:</td>
                        <td>
                            <asp:Label ID="Label11" runat="server" Text="lbl_3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>ID:</td>
                        <td>
                            <asp:Label ID="Label12" runat="server" Text="3"></asp:Label>
                        </td>
                    </tr>
                </table>
                 <%--<asp:Button runat="server" width="100%" ID="Button2" onclick="Button2_Click" Text="Let's GO!" />--%>
            </div>
             <div onclick="redirect(this.id)" class="col-md-3" id="16">
                <table style="width:100%">
                    <tr>
                        <td>Name:</td>
                        <td>
                            <asp:Label ID="Label13" runat="server" Text="lbl_1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td>
                            <asp:Label ID="Label14" runat="server" Text="lbl_2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Category:</td>
                        <td>
                            <asp:Label ID="Label15" runat="server" Text="lbl_3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>ID:</td>
                        <td>
                            <asp:Label ID="Label16" runat="server" Text="4"></asp:Label>
                        </td>
                    </tr>
                </table>
                 <%--<asp:Button runat="server" width="100%" ID="Button3" onclick="Button3_Click" Text="Let's GO!" />--%>
            </div>
        </div>
        <div class="row">
            <div onclick="redirect(this.id)" class="col-md-3" id="20">
                <table style="width:100%">
                    <tr>
                        <td>Name:</td>
                        <td>
                            <asp:Label ID="Label17" runat="server" Text="lbl_1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td>
                            <asp:Label ID="Label18" runat="server" Text="lbl_2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Category:</td>
                        <td>
                            <asp:Label ID="Label19" runat="server" Text="lbl_3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>ID:</td>
                        <td>
                            <asp:Label ID="Label20" runat="server" Text="5"></asp:Label>
                        </td>
                    </tr>
                </table>
                <%--<asp:Button runat="server" width="100%" ID="Button4" onclick="Button4_Click" Text="Let's GO!" />--%>
            </div>
             <div onclick="redirect(this.id)" class="col-md-3" id="24">
                <table style="width:100%">
                    <tr>
                        <td>Name:</td>
                        <td>
                            <asp:Label ID="Label21" runat="server" Text="lbl_1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td>
                            <asp:Label ID="Label22" runat="server" Text="lbl_2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Category:</td>
                        <td>
                            <asp:Label ID="Label23" runat="server" Text="lbl_3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>ID:</td>
                        <td>
                            <asp:Label ID="Label24" runat="server" Text="6"></asp:Label>
                        </td>
                    </tr>
                </table>
                <%-- <asp:Button runat="server" width="100%" ID="Button5" onclick="Button5_Click" Text="Let's GO!" />--%>
            </div>
             <div onclick="redirect(this.id)" class="col-md-3" ID="28">
                <table style="width:100%">
                    <tr>
                        <td>Name:</td>
                        <td>
                            <asp:Label ID="Label25" runat="server" Text="lbl_1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td>
                            <asp:Label ID="Label26" runat="server" Text="lbl_2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Category:</td>
                        <td>
                            <asp:Label ID="Label27" runat="server" Text="lbl_3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>ID:</td>
                        <td>
                            <asp:Label ID="Label28" runat="server" Text="7"></asp:Label>
                        </td>
                    </tr>
                </table>
                <%-- <asp:Button runat="server" width="100%" ID="Button6" onclick="Button6_Click" Text="Let's GO!" />--%>
            </div>
            <div onclick="redirect(this.id)" class="col-md-3">
                <table style="width:100%">
                    <tr>
                        <td>Name:</td>
                        <td>
                            <asp:Label ID="Label29" runat="server" Text="lbl_1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td>
                            <asp:Label ID="Label30" runat="server" Text="lbl_2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Category:</td>
                        <td>
                            <asp:Label ID="Label31" runat="server" Text="lbl_3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>ID:</td>
                        <td>
                            <asp:Label ID="Label32" runat="server" Text="8"></asp:Label>
                        </td>
                    </tr>
                </table>
                <%--<asp:Button runat="server" width="100%" ID="Button7" onclick="Button7_Click" text="Let's GO!"/>--%>
            </div>
        </div>
    </div>
    <div class="container">
        <asp:Button ID="btn_previous" runat="server" Text="Previous" OnClick="btn_previous_Click" />
        <asp:Button ID="btn_next" runat="server" Text="Next" OnClick="btn_next_Click" />
    &nbsp;Page:
        <asp:Label ID="lbl_pagenumber" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="lblID" runat="server"></asp:Label>
        <br />
    </div>
    
   
    
</asp:Content>
