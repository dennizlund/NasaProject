<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<%@ Import Namespace="System.Activities.Statements" %>

<!DOCTYPE html>
<html>

<head>
    <title>NASA Copy | Welcome</title>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="./css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="shortcut icon" type="image/png" href="./images/nasa_logo.png">
    <script src="./javascript/script.js"></script>
    <script src="./javascript/AJAX.js"></script>
</head>

<body>

    <form id="form1" runat="server">

    <div class="grid">
        <div class="navigation">
            <a href="index.aspx"><img src="./images/nasa_logo.png" alt=""></a> 
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
                <div class="searchBox">
                    <div>
                        <input type="text" class="search_input" placeholder="Search" onkeyup="showResult(this.value)">
                        <span id="livesearch"></span>
                    </div>

                    <!--<button type="submit" class="submit_button">Submit</button>-->
                    <div class="loginBtn">
                        <asp:Button Text="Login" runat="server" PostBackUrl="~/AdminLogin.aspx" />
                    </div>
              
                </div>
        </div>

        <div class="news_feed" id="news_feed">
            <div class="news_banner" id="news_feed1">
                <div class="text_block">
                    <h4>Robots in space</h4>
                    <p>Robots are gathering samples from space</p>
                </div>
            </div>
            <div class="news_banner" id="news_feed2">
                <div class="text_block">
                    <h4>Hubble photographs</h4>
                    <p>New pictures taken with hubble telescope</p>
                </div>
            </div>
            <div class="news_banner" id="news_feed3">
                <div class="text_block">
                    <h4>Return to Earth</h4>
                    <p>Expedition 48 have safely returned to Earth</p>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="boxText">
                <h3>NASA events</h3>
                <hr>
                <p>
                    The upcoming events for this month is:
                </p>
                <p>
                    Space launch
                    Hubble telescope gallery
                    Noice from space
                </p>
                <hr id="bottomLine">
            </div>

            <div class="boxImage">
                <img src="./images/onphone.jpg" alt="IMAGE GOES HERE" class="image">
                <div class="text_block">
                    <h4 on>Emma is back</h4>
                    <p id="hover">What the hell</p>
                </div>
                <div class="overlay">
                    <div class="text">Here will be some information about Emmas journey.</div>
                </div>
            </div>

            <div class="updateDiv">
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
        <div class="media">
            <div class="boxVideo">
                <iframe width="100%" height="100%" src="https://www.youtube.com/embed/7shzR4HPbRw" frameborder="0"
                    allow="autoplay; encrypted-media" allowfullscreen></iframe>
            </div>
            <div class="boxImage">
                <img src="./images/oceans.jpg" alt="">
            </div>
            <div>
                <a class="twitter-timeline" data-width="100%" data-height="100%" href="https://twitter.com/NASA?ref_src=twsrc%5Etfw">Tweets
                    by NASA
                </a>
                <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
            </div>
        </div>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [contentText], [titleText], [uploadSrc] FROM [Articles] ORDER BY [id] DESC"></asp:SqlDataSource>
    </form>

</body>

</html>

<!-- style="text-align: right; min-width: 170px; Dennis sökstyle