<%@ Page Title="" Language="C#" MasterPageFile="~/ASP.Net/MasterPages/MainNavBar/Campfire.Master" AutoEventWireup="true" CodeBehind="ActivitiesPage.aspx.cs" Inherits="CampfirePlanner.ASP.Net.ActivitiesPage.ActivitiesPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/ActivitiesPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <asp:HiddenField runat="server" ID="SendA" Value="1" />
    <style>
        .auto-style1 {
            height: 35px;
        }
        \
        .auto-style2 {
            height: 38px;
        }

        .auto-style3 {
            height: 21px;
        }

        .auto-style4 {
            font-family: "Segoe UI";
            font-size: x-small;
        }
    </style>
    <script>
        document.getElementById("<%=SendA.ClientID%>").Value = "3";
    </script>
    <script type="text/javascript">
        function redirect(item) {
            var parse;
            switch (item) {
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
            //Call .cs function
            window.location = '../ActivitiesPage/ActivityDesc.aspx' + '?actID=' + parse;
            return false; //Redirect
        }
    </script>
    <div class="title">
        <div class="row">
            <div class="col-sm-12">
                <%--<h1 class="text-center" style="text-align:center;">Featured Item Here</h1>--%>
                <div class="slideshow-container" style="text-align: center;">
                    <div class="mySlides1">
                        <div class="numText">1 / 3</div>
                        <a href="HomePage.aspx">
                            <img src="../../Images/image1.jpg" style="width: 100%;" /></a>
                        <br />
                        <div class="text">Caption Text</div>
                    </div> 
                    <div class="mySlides1">
                        <div class="numText">2 / 3</div>
                        <a href="HomePage.aspx">
                            <img src="../../Images/image2.jpg" style="width: 100%;" /></a>
                        <br />
                        <div class="text">Caption Text</div>
                    </div>
                    <div class="mySlides1 ">
                        <div class="numText">3 / 3</div>
                        <a href="HomePage.aspx">
                            <img src="../../Images/image3.jpg" style="width: 100%;" /></a>
                        <br />
                        <div class="text">Caption Text</div>
                    </div>
                    <a class="prev" onclick="plusSlides(-1)" style="color: white;">&#10094;</a>
                    <a class="next" onclick="plusSlides(1)" style="color: white;">&#10095;</a>
                </div>
                <div style="text-align: center">
                    <span class="dot1" onclick="currentSlide(1)"></span>
                    <span class="dot1" onclick="currentSlide(2)"></span>
                    <span class="dot1" onclick="currentSlide(3)"></span>
                </div>
                <br />
                <h2 style="text-align: center;">Featured Activities</h2>
            </div>
        </div>
    </div> 

    <div class="col-md-12">
        <div style="align-self:center" class="text-center">
                <asp:CheckBoxList Width="100%" ID="cbl_categories" runat="server" OnSelectedIndexChanged="cbl_categories_SelectedIndexChanged" RepeatDirection="Horizontal" AutoPostBack="True" CssClass="categoriesbox">
                    <asp:ListItem Value="a">CategoryOne</asp:ListItem>
                    <asp:ListItem Value="b">CategoryTwo</asp:ListItem>
                    <asp:ListItem Value="c">CategoryThree</asp:ListItem>
                    <asp:ListItem Value="d">CategoryFour</asp:ListItem>
                </asp:CheckBoxList>
            <br />
        </div>
        <h3 style="text-align: center;">Please Select Categories to Display</h3>
        <br />
    </div>

    <div class="container">
        <div class="row">
            <div onclick="redirect(this.id)" class="col-md-2" id="4" style="border: 3px solid black; background-image: url(<%= getImage()%>)">
                <a href="ActivityDesc.aspx">
                    <img src="../../Images/image2.jpg" width="100%" style="border: 3px solid black; border-top: 0.01px solid black;" /></a>
                <table class="box" style="width: 100%">
                    <tr>
                        <td class="auto-style3"><strong>
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </strong></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" CssClass="auto-style4"></asp:Label>
                            <asp:Label ID="Label4" runat="server" Text="1" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <%--<asp:Button runat="server" width="100%" ID="Button0" OnClick="Button0_Click" Text="Let's GO!" />--%>
            </div>

            <div onclick="redirect(this.id)" class="col-md-2" id="8" style="border: 3px solid black;">
                <a href="ActivityDesc.aspx">
                    <img src="../../Images/image2.jpg" width="100%" style="border: 3px solid black; border-top: 0.01px solid black;" /></a>
                <table class="box" style="width: 100%">
                    <tr>
                        <td><strong>
                            <asp:Label ID="Label5" runat="server"></asp:Label>
                        </strong></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" CssClass="auto-style4"></asp:Label>
                            <asp:Label ID="Label8" runat="server" Text="2" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <%--<asp:Button runat="server" width="100%" ID="Button1" onclick="Button1_Click" Text="Let's GO!" />--%>
            </div>

            <div onclick="redirect(this.id)" class="col-md-2" id="12" style="border: 3px solid black;">
                <a href="ActivityDesc.aspx">
                    <img src="../../Images/image2.jpg" width="100%" style="border: 3px solid black; border-top: 0.01px solid black;" /></a>
                <table class="box" style="width: 100%">
                    <tr>
                        <td><strong>
                            <asp:Label ID="Label9" runat="server"></asp:Label>
                        </strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label10" runat="server" CssClass="auto-style4"></asp:Label>
                            <asp:Label ID="Label12" runat="server" Text="3" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <%--<asp:Button runat="server" width="100%" ID="Button2" onclick="Button2_Click" Text="Let's GO!" />--%>
            </div>

            <div onclick="redirect(this.id)" class="col-md-2" id="16" style="border: 3px solid black;">
                <a href="ActivityDesc.aspx">
                    <img src="../../Images/image2.jpg" width="100%" style="border: 3px solid black; border-top: 0.01px solid black;" /></a>
                <table class="box" style="width: 100%">
                    <tr>
                        <td><strong>
                            <asp:Label ID="Label13" runat="server"></asp:Label>
                        </strong></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label14" runat="server" CssClass="auto-style4"></asp:Label>
                            <asp:Label ID="Label16" runat="server" Text="4" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <%--<asp:Button runat="server" width="100%" ID="Button3" onclick="Button3_Click" Text="Let's GO!" />--%>
            </div>
        </div>
        <div class="row">
            <div onclick="redirect(this.id)" class="col-md-2" id="20" style="border: 3px solid black;">
                <a href="ActivityDesc.aspx">
                    <img src="../../Images/image2.jpg" width="100%" style="border: 3px solid black; border-top: 0.01px solid black;" /></a>
                <table class="box" style="width: 100%">
                    <tr>
                        <td><strong>
                            <asp:Label ID="Label17" runat="server"></asp:Label>
                        </strong></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label18" runat="server" CssClass="auto-style4"></asp:Label>
                            <asp:Label ID="Label20" runat="server" Text="5" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <%--<asp:Button runat="server" width="100%" ID="Button4" onclick="Button4_Click" Text="Let's GO!" />--%>
            </div>

            <div onclick="redirect(this.id)" class="col-md-2" id="24" style="border: 3px solid black;">
                <a href="ActivityDesc.aspx">
                    <img src="../../Images/image2.jpg" width="100%" style="border: 3px solid black; border-top: 0.01px solid black;" /></a>
                <table class="box" style="width: 100%">
                    <tr>
                        <td><strong>
                            <asp:Label ID="Label21" runat="server"></asp:Label>
                        </strong></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label22" runat="server" CssClass="auto-style4"></asp:Label>
                            <asp:Label ID="Label24" runat="server" Text="6" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <%-- <asp:Button runat="server" width="100%" ID="Button5" onclick="Button5_Click" Text="Let's GO!" />--%>
            </div>

            <div onclick="redirect(this.id)" class="col-md-2" id="28" style="border: 3px solid black;">
                <a href="ActivityDesc.aspx">
                    <img src="../../Images/image2.jpg" width="100%" style="border: 3px solid black; border-top: 0.01px solid black;" /></a>
                <table class="box" style="width: 100%">
                    <tr>
                        <td class="auto-style2"><strong>
                            <asp:Label ID="Label25" runat="server"></asp:Label>
                        </strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="Label26" runat="server" CssClass="auto-style4"></asp:Label>
                            <asp:Label ID="Label28" runat="server" Text="7" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <%-- <asp:Button runat="server" width="100%" ID="Button6" onclick="Button6_Click" Text="Let's GO!" />--%>
            </div>

            <div onclick="redirect(this.id)" class="col-md-2" style="border: 3px solid black;">
                <a href="ActivityDesc.aspx">
                    <img src="../../Images/image2.jpg" width="100%" style="border: 3px solid black; border-top: 0.01px solid black;" /></a>
                <table class="box" style="width: 100%;">
                    <tr>
                        <td><strong>
                            <asp:Label ID="Label29" runat="server"></asp:Label>
                        </strong></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label30" runat="server" CssClass="auto-style4"></asp:Label>
                            <asp:Label ID="Label32" runat="server" Text="8" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <%--<asp:Button runat="server" width="100%" ID="Button7" onclick="Button7_Click" text="Let's GO!"/>--%>
            </div>
        </div>
    </div>
    <div class="container" style="text-align: center;">
        <asp:Button ID="btn_previous" runat="server" Text="Previous" OnClick="btn_previous_Click" />
        <asp:Button ID="btn_next" runat="server" Text="Next" OnClick="btn_next_Click" />
        <br>
        Page:
        <asp:Label ID="lbl_pagenumber" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="lblID" runat="server"></asp:Label>
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
            if (n > slides.length) {slideIndex = 1; }
            if (n < 1) {slideIndex = slides.length; }
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
        /*var slideIndex = [1, 1];
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
        }*/

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
    <!--<audio src="../n057.mp3" autoplay="autoplay" loop="loop"></audio>--> <!--If it's too quiet-->
</asp:Content>
