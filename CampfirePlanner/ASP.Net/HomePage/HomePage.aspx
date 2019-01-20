<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="CampfirePlannerPlanner.ASP.Net.HomePage.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Css/HomePage.css" rel="stylesheet" />
    <Script src="../../Scripts/scrolltotop.js"></script>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style2 {
            margin-right: 142px;
        }
        .auto-style3 {
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div class="scrollUp">
        <br />
            <%--&nbsp;&nbsp;&nbsp;--%>
        <input type="submit" class="scrollButton" value="Top" />
    </div>
    <div class="main">
        <div class="row">
            <div class="col-sm-12">
                <!--Other Games-->
                <div>
                    <h2>Activity Categories</h2>
                    <p style="border-bottom:solid; border-color: salmon">From <i><b>casual icebreakers</b></i> to intense <i><b>team matches</b></i>, be it 5 minutes or 2 hours, you will definitely find what you are looking for using our extensive <i><b>Activity Catalogue</b></i>!</p>
                        <table class="col-md-12">
                            <tr>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <img src="../../Images/ice.jpeg" width="150" height="150" class="photo" />
                                    <p class="auto-style3"><b>IceBreakers(<5)</b></p>
                                </td>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <img src="../../Images/ice3.jpg" width="150" height="150" class="photo" />
                                    <p class="captiontext">IceBreakers(5-12)</p>
                                </td>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <img src="../../Images/ice2.jpg" width="150" height="150" class="photo" />
                                    <p class="captiontext">IceBreakers(12-16)</p>
                                </td>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <img src="../../Images/ice4.jpg" width="150" height="150" class="photo" />
                                    <p class="captiontext">IceBreakers(>16)</p>
                                </td>
                            </tr>
                        </table>

                        <table class="col-md-12">
                            <tr>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <img src="../../Images/summer.jpg" width="150" height="150" class="photo" />
                                    <p class="auto-style3"><b>It's Summer!</b></p>
                                </td>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <img src="../../Images/winter.jpg" width="150" height="150" class="photo" />
                                    <p class="captiontext">Winter Fun!</p>
                                </td>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <img src="../../Images/beachparty.jpg" width="150" height="150" class="photo" />
                                    <p class="captiontext">Beach Zone</p>
                                </td>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <img src="../../Images/pool.jpg" width="150" height="150" class="photo" />
                                    <p class="captiontext">Pool Parties</p>
                                </td>
                            </tr>
                        </table>

                        <table class="col-md-12">
                            <tr>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <img src="../../Images/formal.jpg" width="150" height="150" class="photo" />
                                    <p class="auto-style3"><b>Formal Activities</b></p>
                                </td>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <img src="../../Images/office.jpg" width="150" height="150" class="photo" />
                                    <p class="captiontext">Office Events</p>
                                </td>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <img src="../../Images/fire.jpg" width="150" height="150" class="photo" />
                                    <p class="captiontext">Something NEW!</p>
                                </td>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <img src="../../Images/cheeky.jpg" width="150" height="150" class="photo" />
                                    <p class="captiontext">Something CHEEKY!</p>
                                </td> 
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body2" runat="server">
    <div class="featured">
        <!--Featured Activities-->
        <br />
        <h2>Featured Activities</h2>
        <p style="border-bottom:solid; border-color:salmon;">Activities people favoured this week!</p>
        <br />
        <div class="slideshow-container" style="text-align:center;">
            <div class="mySlides1">
                <div class="numText">1 / 3</div>
                <a href="HomePage.aspx"><img src="../../Images/image1.jpg" style="width:80%"/></a>
                <br />
                <br />
                <br />
                <br />
                <div class="text">Mt. Rainer National Park</div>
            </div>
            <div class="mySlides1">
                <div class="numText">2 / 3</div>
                <a href="HomePage.aspx"><img src="../../Images/image2.jpg" style="width:80%;" /></a>
                <br />
                <br />
                <br />
                <br />
                <div class="text">Pyramid of Giza</div>
            </div>
            <div class="mySlides1">
                <div class="numText">3 / 3</div>
                <a href="HomePage.aspx"><img src="../../Images/image3.jpg" style="width:80%;" /></a>
                <br />
                <br />
                <br />
                <br />
            <div class="text">Misty Mountain Lake</div>
            </div>
            <a class="prev" onclick="plusSlides(-1, 0)">&#10094;</a>
            <a class="next" onclick="plusSlides(1, 0)">&#10095;</a>
        </div>
        <div style="text-align:center">
            <span class="dot1" onclick="currentSlide(1)"></span> 
            <span class="dot1" onclick="currentSlide(2)"></span> 
            <span class="dot1" onclick="currentSlide(3)"></span> 
        </div>
        <br />

        <!--Featured Schedules-->
        <h2>Suggested Schedules</h2>
        <div class="slideshow-container" style="text-align:center;">
            <div class="mySlides2">
                <div class="numText">1 / 3</div>
                <a href="HomePage.aspx"><img src="../../Images/image1.jpg" style="width:80%;" /></a>
                <%--<div class="text">Caption Text</div>--%>
            </div>
            <div class="mySlides2">
                <div class="numText">2 / 3</div>
                <a href="HomePage.aspx"><img src="../../Images/image2.jpg" style="width:80%;" /></a>
                <%--<div class="text">Caption Text</div>--%>
            </div>
            <div class="mySlides2">
                <div class="numText">3 / 3</div>
                <a href="HomePage.aspx"><img src="../../Images/image3.jpg" style="width:80%;" /></a>
                <%--<div class="text">Caption Text</div>--%>
            </div>
            <a class="prev" onclick="plusSlides(-1, 1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1, 1)">&#10095;</a>
        </div>
        <div style="text-align:center">
            <span class="dot2" onclick="currentSlide(1)"></span> 
            <span class="dot2" onclick="currentSlide(2)"></span> 
            <span class="dot2" onclick="currentSlide(3)"></span> 
        </div>
        <br />
    </div>

        <!---Scripts--->
        <script>
          //Single slideshow
            /*var slideIndex = 1;
            showSlides(slideIndex);
            function plusSlides(n) {
              showSlides(slideIndex += n);
            }
            function currentSlide(n) {
              showSlides(slideIndex = n);
            }
            function showSlides(n) {
              var i;
              var slides = document.getElementsByClassName("mySlides1");
              var dots = document.getElementsByClassName("dot");
                if (n > slides.length) { slideIndex = 1; }    
                if (n < 1) { slideIndex = slides.length; }
              for (i = 0; i < slides.length; i++) {
                  slides[i].style.display = "none";  
              }
              for (i = 0; i < dots.length; i++) {
                  dots[i].className = dots[i].className.replace(" active", "");
              }
              slides[slideIndex-1].style.display = "block";  
              dots[slideIndex-1].className += " active";
            }*/
            
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
            
            //Automatic scrolling
            /*var slideIndex = 0;
            var slideId = ["mySlides1" , "mySlides2"];
            showSlides(1,0);
            showSlides(1,1);
            function showSlides(n, no) {
                var i;
                var x = document.getElementsByClassName("slideId[n,no]");
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) {slideIndex = 1}
                slides[slideIndex-1].style.display = "block";
                setTimeout(showSlides, 2000); // Change image every 2 seconds
            }*/ 
        </script>
        
        <script> 
            //Scroll to Top
            $(header).ready(function () {
                $(this).scrollTop(0);
            });
        </script>
        <script>
            window.onload = function () {
                window.scrollTo(0, 0);
            };
        </script>
</asp:Content>
<%--<asp:Content ID="Content4" ContentPlaceHolderID="body3" runat="server">
    <!--Category Bar-->
    <br />
    <br />
    <br />
    <br />
    <div class="row">
        <div class="col-sm-2">
            <div class="categories">
                <table class="clist">
                    <tr>
                        <th class="auto-style1">Categories</th>
                        <th></th>
                    </tr>
                    <tr>
                        <asp:CheckBoxList ID="cbl_categories" runat="server" RepeatDirection="Vertical" AutoPostBack="True" Width="200px" CssClass="auto-style2" Height="159px">
                            <asp:ListItem Value="a">Action</asp:ListItem>
                            <asp:ListItem Value="b">Adventure</asp:ListItem>
                            <asp:ListItem Value="c">Rhythm</asp:ListItem>
                            <asp:ListItem Value="d">Icebreaker</asp:ListItem>
                        </asp:CheckBoxList>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>--%>