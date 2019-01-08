<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="ActivityDesc.aspx.cs" Inherits="CampfirePlanner.ASP.Net.ActivitiesPage.ActivityDesc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/activityDesc.css" rel="stylesheet" />
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

        .auto-style5 {
            height: 72px;
        }

        .auto-style6 {
            text-align: center;
            width: 469px;
            height: 56px;
        }

        .auto-style7 {
            height: 56px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body2" runat="server">
                <div class="col-sm-12">
                    <%--<asp:Label ID="lbl_activityid" runat="server"></asp:Label>--%>
                    <div id="slideshow" class="slideshow-container" style="text-align: center;">
                        <div id="slide1" class="mySlides1">
                            <img id="image1" runat="server" src="" style="height: 250px;" />
                        </div>
                        <a class="prev" onclick="plusSlides(-1, 0)" style="color: white;">&#10094;</a>
                        <a class="next" onclick="plusSlides(1, 0)" style="color: white;">&#10095;</a>
                    </div>
                    <script>
                        if (<%= slideshowCount()%> == 2) {
                            var div = document.createElement("div");
                            div.id = "slide2";
                            div.className = "mySlides1";
                            div.innerHTML += "<img src=\"<%= getImgLink()%>\" id=\"image2\" style=\"height: 250px;\">"
                            document.getElementById("slideshow").appendChild(div);
                        }
                        else if (<%= slideshowCount()%> == 3) {
                            var div = document.createElement("div");
                            div.id = "slide3";
                            div.className = "mySlides1";
                            div.innerHTML += "<img src=\"<%= getImgLink2()%>\" id=\"image3\" style=\"height: 250px;\">"
                            document.getElementById("slideshow").appendChild(div);
                        }
                    </script>
                    <h2 style="text-align: center;">Featured Activities</h2>
                </div>
    <asp:Label ID="lblTitle" runat="server"></asp:Label>
    <%--<asp:Button ID="btnDel" runat="server" CssClass="auto-style4" Height="44px" OnClick="btnDel_Click" Text="Delete Activity" Visible="False" Width="170px" OnClientClick="return confirm('Are You Sure?')"--%> />
    <asp:Label ID="lblDuration" runat="server"></asp:Label>
    <asp:Label ID="lblDesc" runat="server"></asp:Label>
    <asp:Label ID="lblLinks" runat="server"></asp:Label>
    <asp:Button ID="btnUpVote" runat="server" OnClick="btnUpVote_Click1" Text="Up" />
    <asp:Label ID="lblVotes" runat="server"></asp:Label>
    <asp:Button ID="btnDownVote" runat="server" Text="Button" />
    <asp:Label ID="lblCategories" runat="server"></asp:Label>
    <asp:Label ID="lblExp" runat="server"></asp:Label>
    <script>
        //Multiple slideshows
        var slideIndex = [1, 1];
        var slideId = ["mySlides1", "mySlides2"];
        var dotId = ["dot1", "dot2"];
        showSlides(1, 0);
        showSlides(1, 1);

        function plusSlides(n, no) {
            showSlides(slideIndex[no] += n, no);
        }

        function showSlides(n, no) {
            var i;
            var x = document.getElementsByClassName(slideId[no]);
            var dots = document.getElementsByClassName(dotId[no]);
            if (n > x.length) { slideIndex[no] = 1; }
            if (n < 1) { slideIndex[no] = x.length; }
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            x[slideIndex[no] - 1].style.display = "block";
            dots[slideIndex[no] - 1].className += " active";
        }
    </script>
</asp:Content>
