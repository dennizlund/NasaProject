<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Content.aspx.cs" Inherits="Content" %>

<%@ Import Namespace="System.Activities.Statements" %>

<!DOCTYPE html>
<html>

<head>
    <title>Page Title</title>
    <link rel="stylesheet" href="./css/style.css">
</head>


<body>
    <div class="grid" id="contentPage">
        <div class="navigation">
            <img src="./images/nasa_logo.png" alt="">
            <div style="min-width: 910px">
                <ul id="dropdown">
                    <li>
                        <a href="mission.html">Mission</a>
                    </li>
                    <li>
                        <a href="galleries.html">Galleries</a>
                    </li>
                    <li>
                        <a href="nasatv.html">NASA TV</a>
                    </li>
                    <li>
                        <a href="follow.html">Follow</a>
                    </li>
                    <li>
                        <a href="downloads.html">Downloads</a>
                    </li>
                    <li>
                        <a href="about.html">About</a>
                    </li>
                    <li>
                        <a href="nasaaudiences.html">NASA Audiences</a>
                    </li>
                </ul>
                <ul id="links">
                    <li>
                        <a href="humansinspace.html">Humans in Space</a>
                    </li>
                    <li>
                        <a href="moontomars.html">Moon to Mars</a>
                    </li>
                    <li>
                        <a href="earth.html">Earth</a>
                    </li>
                    <li>
                        <a href="spacetech.html">Space Tech</a>
                    </li>
                    <li>
                        <a href="flight.html">Flight</a>
                    </li>
                    <li>
                        <a href="solarsystemandbeyond.html">Solar System and Beyond</a>
                    </li>
                    <li>
                        <a href="education.html">Education</a>
                    </li>
                    <li>
                        <a href="history.html">History</a>
                    </li>
                    <li>
                        <a href="benefitsyou.html">Benefits you</a>
                    </li>
                </ul>
            </div>
            <form action="/" method="post" runat="server">
                <div style="text-align: right; min-width: 170px;">
                    <input type="text" class="search_input" value="Search">
                    <button type="submit" class="submit_button">Submit</button>
                    <asp:Button Text="Login" runat="server" PostBackUrl="~/AdminLogin.aspx" />
                </div>
            </form>
        </div>
        <div class="updateDiv" id="contentUpdate">
            <div class="boxImage" id="updateImage">
                <img src="./images/60th.jpg" runat="server" alt="" id="imageUpdate">
                <video controls="controls" runat="server" id="videoUpdate" width="100%" height="100%">
                    <source src="./Uploads/sherlock.mp4" />
                </video>
            </div>
            <div class="boxText" id="updateContent">

                <h4 runat="server" id="title">This is a h4 element.</h4>
                <p runat="server" id="paragraph">This is a p element</p>

            </div>
        </div>
    </div>
</body>

</html>
