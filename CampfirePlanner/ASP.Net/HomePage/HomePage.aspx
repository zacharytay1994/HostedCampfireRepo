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
                                    <a href="../ActivitiesPage/ActivitiesPage.aspx?catid=['a']">
                                        <div class="insideInfo">
                                            <img src="../../Images/ice.jpeg" width="150" height="150" class="photo" />
                                            <div class="middle">
                                                <div class="infoHead">IceBreakers(<5)</div>
                                                <p class="infoBody">Classic Ice-Breakers for kids 5 and below! Guaranteed kids friendly games!</p>
                                            </div>
                                        </div>
                                    </a>
                                    <p class="auto-style3"><b>IceBreakers(<5)</b></p>
                                </td>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <a href="../ActivitiesPage/ActivitiesPage.aspx?catid=['a']">
                                        <div class="insideInfo">
                                            <img src="../../Images/ice3.jpg" width="150" height="150" class="photo" />
                                            <div class="middle">
                                                <div class="infoHead">IceBreakers(5-12)</div>
                                                <p class="infoBody">Classic Ice-Breakers for kids 5- 12! Fun for all!</p>
                                            </div>
                                        </div>
                                    </a>
                                    <p class="captiontext">IceBreakers(5-12)</p>
                                </td>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <a href="../ActivitiesPage/ActivitiesPage.aspx?catid=['a']">
                                        <div class="insideInfo">
                                            <img src="../../Images/ice2.jpg" width="150" height="150" class="photo" />
                                            <div class="middle">
                                                <div class="infoHead">IceBreakers(12-16)</div>
                                                <p class="infoBody">Classic Ice-Breakers for teenagers 12-16! Guarantee a blast!</p>
                                            </div>
                                        </div>
                                    </a>
                                    <p class="captiontext">IceBreakers(12-16)</p>
                                </td>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <a href="../ActivitiesPage/ActivitiesPage.aspx?catid=['a']">
                                        <div class="insideInfo">
                                            <img src="../../Images/ice4.jpg" width="150" height="150" class="photo" />
                                            <div class="middle">
                                                <div class="infoHead">IceBreakers(>16)</div>
                                                <p class="infoBody">Classic Ice-Breakers for ages > 16! FUN FUN FUN!</p>
                                            </div>
                                        </div>
                                    </a>
                                    <p class="captiontext">IceBreakers(>16)</p>
                                </td>
                            </tr>
                        </table>

                        <table class="col-md-12">
                            <tr>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <a href="../ActivitiesPage/ActivitiesPage.aspx?catid=['a']">
                                        <div class="insideInfo">
                                            <img src="../../Images/summer.jpg" width="150" height="150" class="photo" />
                                            <div class="middle">
                                                <div class="infoHead">It's Summer!</div>
                                                <p class="infoBody">Fun filled sun activities! Remember your sunscreen!</p>
                                            </div>
                                        </div>
                                    </a>
                                    <p class="auto-style3"><b>It's Summer!</b></p>
                                </td>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <a href="../ActivitiesPage/ActivitiesPage.aspx?catid=['a']">
                                        <div class="insideInfo">
                                            <img src="../../Images/winter.jpg" width="150" height="150" class="photo" />
                                            <div class="middle">
                                                <div class="infoHead">Winter Fun!</div>
                                                <p class="infoBody">Indoor Outdoors "Brrr" Chily Goodness!</p>
                                            </div>
                                        </div>
                                    </a>
                                    <p class="captiontext">Winter Fun!</p>
                                </td>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <a href="../ActivitiesPage/ActivitiesPage.aspx?catid=['a']">
                                        <div class="insideInfo">
                                            <img src="../../Images/beachparty.jpg" width="150" height="150" class="photo" />
                                            <div class="middle">
                                                <div class="infoHead">Beach Zone</div>
                                                <p class="infoBody">Beach, Balls, and Babes!</p>
                                            </div>
                                        </div>
                                    </a>
                                    <p class="captiontext">Beach Zone</p>
                                </td>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <a href="../ActivitiesPage/ActivitiesPage.aspx?catid=['a']">
                                        <div class="insideInfo">
                                            <img src="../../Images/pool.jpg" width="150" height="150" class="photo" />
                                            <div class="middle">
                                                <div class="infoHead">Pool Parties</div>
                                                <p class="infoBody">Water activities guaranteed to make you wet!</p>
                                            </div>
                                        </div>
                                    </a>
                                    <p class="captiontext">Pool Parties</p>
                                </td>
                            </tr>
                        </table>

                        <table class="col-md-12">
                            <tr>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <a href="../ActivitiesPage/ActivitiesPage.aspx?catid=['a']">
                                        <div class="insideInfo">
                                            <img src="../../Images/formal.jpg" width="150" height="150" class="photo" />
                                            <div class="middle">
                                                <div class="infoHead">Formal Activities</div>
                                                <p class="infoBody">A Prom, A Wedding, We got you covered!</p>
                                            </div>
                                        </div>
                                    </a>
                                    <p class="auto-style3"><b>Formal Activities</b></p>
                                </td>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <a href="../ActivitiesPage/ActivitiesPage.aspx?catid=['a']">
                                        <div class="insideInfo">
                                            <img src="../../Images/office.jpg" width="150" height="150" class="photo" />
                                            <div class="middle">
                                                <div class="infoHead">Office Events</div>
                                                <p class="infoBody">All work and no play, more like all play and no work!</p>
                                            </div>
                                        </div>
                                    </a>
                                    <p class="captiontext">Office Events</p>
                                </td>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <a href="../ActivitiesPage/ActivitiesPage.aspx?catid=['a']">
                                        <div class="insideInfo">
                                            <img src="../../Images/fire.jpg" width="150" height="150" class="photo" />
                                            <div class="middle">
                                                <div class="infoHead">Something New!</div>
                                                <p class="infoBody">Want to try some experimental games? At your own risk!</p>
                                            </div>
                                        </div>
                                    </a>
                                    <p class="captiontext">Something NEW!</p>
                                </td>
                                <td class="auto-style3">
                                    <p class="auto-style3">&nbsp;</p>
                                    <a href="../ActivitiesPage/ActivitiesPage.aspx?catid=['a']">
                                        <div class="insideInfo">
                                            <img src="../../Images/cheeky.jpg" width="150" height="150" class="photo" />
                                            <div class="middle">
                                                <div class="infoHead">Something CHEEKY</div>
                                                <p class="infoBody">Break the ice real fast, with some strip poker!</p>
                                            </div>
                                        </div>
                                    </a>
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
        <div class="slideshow-container" style="text-align:center">
            <div class="mySlides1">
                <div class="numText">1 / 3</div>
                <a href="HomePage.aspx"><img src="../../Images/image1.jpg" style="width:90%"/></a>
                <br />
                <br />
                <br />
                <br />
                <div class="text">Mt. Rainer National Park</div>
            </div>
            <div class="mySlides1">
                <div class="numText">2 / 3</div>
                <a href="HomePage.aspx"><img src="../../Images/image2.jpg" style="width:90%" /></a>
                <br />
                <br />
                <br />
                <br />
                <div class="text">Pyramid of Giza</div>
            </div>
            <div class="mySlides1">
                <div class="numText">3 / 3</div>
                <a href="HomePage.aspx"><img src="../../Images/image3.jpg" style="width:90%" /></a>
                <br />
                <br />
                <br />
                <br />
            <div class="text">Misty Mountain Lake</div>
            </div>
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
                <a href="HomePage.aspx"><img src="../../Images/image1.jpg" style="width:90%;" /></a>
                <br />
                <br />
                <br />
                <br />
                <div class="text">Mt. Rainer National Park</div>
            </div>
            <div class="mySlides2">
                <div class="numText">2 / 3</div>
                <a href="HomePage.aspx"><img src="../../Images/image2.jpg" style="width:90%;" /></a>
                <br />
                <br />
                <br />
                <br />
                <div class="text">Pyramid of Giza</div>
            </div>
            <div class="mySlides2">
                <div class="numText">3 / 3</div>
                <a href="HomePage.aspx"><img src="../../Images/image3.jpg" style="width:90%;" /></a>
                <br />
                <br />
                <br />
                <br />
                <div class="text">Misty Mountain Lake</div>
            </div>
        </div>
        <div style="text-align:center">
            <span class="dot2" onclick="currentSlide(1)"></span> 
            <span class="dot2" onclick="currentSlide(2)"></span> 
            <span class="dot2" onclick="currentSlide(3)"></span> 
        </div>
    </div>
        <!---Scripts--->
        <script>
          //Single slideshow
            //var slideIndex = 1;
            //showSlides(slideIndex);
            //function plusSlides(n) {
            //  showSlides(slideIndex += n);
            //}
            //function currentSlide(n) {
            //  showSlides(slideIndex = n);
            //}
            //function showSlides(n) {
            //  var i;
            //  var slides = document.getElementsByClassName("mySlides1");
            //  var dots = document.getElementsByClassName("dot");
            //    if (n > slides.length) { slideIndex = 1; }    
            //    if (n < 1) { slideIndex = slides.length; }
            //  for (i = 0; i < slides.length; i++) {
            //      slides[i].style.display = "none";  
            //  }
            //  for (i = 0; i < dots.length; i++) {
            //      dots[i].className = dots[i].className.replace(" active", "");
            //  }
            //  slides[slideIndex-1].style.display = "block";  
            //  dots[slideIndex-1].className += " active";
            //}

             //// Next/previous controls
            //function plusSlides(n) {
            //    showSlides(slideIndex += n);
            //}

            //// Thumbnail image controls
            //function currentSlide(n) {
            //    showSlides(slideIndex = n);
            //    showSlides2(slideIndex = n);
            //}

//Multiple slideshows
        var slideIndex = 0;
        showSlides(slideIndex);
        showSlides2(slideIndex);

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

        function showSlides2() {
            var i;
            var slides = document.getElementsByClassName("mySlides2");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) { slideIndex = 1 }
            slides[slideIndex - 1].style.display = "block";
            setTimeout(showSlides2, 3000); // Change image every 3 seconds
        }
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