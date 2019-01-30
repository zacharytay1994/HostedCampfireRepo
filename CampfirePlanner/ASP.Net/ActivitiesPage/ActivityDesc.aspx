<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="ActivityDesc.aspx.cs" Inherits="CampfirePlanner.ASP.Net.ActivitiesPage.ActivityDesc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/activityDesc.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 100%;
            width: 100%;
        }
        .auto-style2 {
            position: relative;
            width: 100%;
            min-height: 1px;
            -ms-flex: 0 0 100%;
            flex: 0 0 100%;
            max-width: 100%;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
        .auto-style3 {
            width: 500px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body2" runat="server">
                <div class="auto-style2">

                    <table class="w-100">
                        <tr>
                            <td>
                                <asp:Label ID="lblTitle" Font-Bold="true" Font-Size="Large"  runat="server"></asp:Label>
                            <%--<asp:Button ID="btnDel" runat="server" CssClass="auto-style4" Height="44px" OnClick="btnDel_Click" Text="Delete Activity" Visible="False" Width="170px" OnClientClick="return confirm('Are You Sure?')"--%>
                            <div id="slideshow" class="slideshow-container" style="text-align: left;">
                                <div id="slide1" class="mySlides1">
                                    <img id="image1" runat="server" src="" class="auto-style1" />
                                </div>
                                <a class="prev" onclick="plusSlides(-1, 0)" style="color: white;">&#10094;</a>
                                <a class="next" onclick="plusSlides(1, 0)" style="color: white;">&#10095;</a>
                            </div>

                            <script>
                                if (<%= slideshowCount()%> == 2) {
                                    var div = document.createElement("div");
                                    div.id = "slide2";
                                    div.className = "mySlides1";
                                    div.innerHTML += "<img src=\"<%= getImgLink()%>\" id=\"image2\" style=\" width: 100%; height: 450px;\">"
                                    document.getElementById("slideshow").appendChild(div);
                                }
                                else if (<%= slideshowCount()%> == 3) {
                                    var div = document.createElement("div");
                                    div.id = "slide3";
                                    div.className = "mySlides1";
                                    div.innerHTML += "<img src=\"<%= getImgLink2()%>\" id=\"image3\" style=\" width: 100%; height: 450px;\">"
                                    document.getElementById("slideshow").appendChild(div);
                                }
                            </script>

                            </td>
                            <td class="auto-style3">
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <asp:ImageButton ID="btnUpVote" runat="server" ImageUrl="~/Images/thumbs-up.png" CssClass="btnUP" Width="25px" Height="25px" OnClick="btnUpVote_Click" />
                    
                                <asp:ImageButton ID="btnDownVote" runat="server" ImageUrl="~/Images/dislike-thumb.png" CssClass="btnDOWN" Width="25px" Height="25px" OnClick="btnDownVote_Click" />
                    
                                <asp:Label ID="lblVotes" runat="server"></asp:Label>
                            </td>
                            <td class="text-center">
                                <asp:Label ID="lblDesc" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="lblExp" runat="server"></asp:Label>
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Categories:
                                <asp:Label ID="lblCategories" runat="server"></asp:Label>
                                <br />
                                Time Required:
                                <asp:Label ID="lblDuration" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="lblLinks" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                            
    <div style="text-align:center">
        <asp:GridView ID="gvComments" runat="server" AutoGenerateColumns="False" CssClass="comments">
            <Columns>
                <asp:BoundField DataField="Username" HeaderText="Username" />
                <asp:BoundField DataField="CommentText" HeaderText="Comment" />
            </Columns>
        </asp:GridView>
                    <br />
        <asp:Label ID="lblComments" runat="server" Text="Add a Comment: "></asp:Label>
        <asp:TextBox ID="txtAddComment" runat="server" Width="789px"></asp:TextBox>
        <asp:Button ID="btnSubmitComment" runat="server" Text="Submit" OnClick="btnSubmitComment_Click" />
        <asp:Label ID="lblThanks" runat="server"></asp:Label>
        <br />
        <br />
        <br />
    </div>

    
    <script>
        //Multiple slideshows
        var slideIndex = 0;
        showSlides(slideIndex);

        // Next/previous controls
        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        // Thumbnail image controls
        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides1");
            var dots = document.getElementsByClassName("dot1");
            if (n > slides.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = slides.length }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
        }

        function showSlides() {
            var i;
            var slides = document.getElementsByClassName("mySlides1");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) { slideIndex = 1 }
            slides[slideIndex - 1].style.display = "block";
            setTimeout(showSlides, 3000); // Change image every 3 seconds
        }
    </script>
                </div>
</asp:Content>
