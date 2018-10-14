<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<!DOCTYPE html>

<%--<html xmlns="http://www.w3.org/1999/xhtml">--%>
<html>

<head>
    <title>Page Title</title>
    <link rel="stylesheet" href="./css/style.css" type="text/css">
</head>

<body>
    <form id="form3" runat="server">
        <div class="grid">

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

                <div class="searchBox">
                    <div>
                        <input type="text" class="search_input" placeholder="Search" onkeyup="showResult(this.value)">
                        <span id="livesearch"></span>
                    </div>

                    <!--<button type="submit" class="submit_button">Submit</button>-->
                    <div class="loginBtn">
                        <asp:Button Text="Login" ID="Button2" OnClick="btnLogin_OnClick" runat="server" PostBackUrl="~/AdminLogin.aspx" />
                    </div>

                </div>

            </div>
            <div class="loginArea">
                <label for="userName">Username</label>
                <asp:TextBox ID="userName" runat="server" TextMode="SingleLine" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="userName"
                    ErrorMessage="Username is a required field."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <label for="password">Password</label>
                <asp:TextBox ID="password" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="password"
                    ErrorMessage="Password is a required field."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:Button ID="btnLogin" runat="server" OnClick="Button1_Click" Text="Login" />
                <asp:Button ID="btnBack" runat="server" OnClick="btnBack_OnClick" Text="Home" CausesValidation="False" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [UserAccounts] WHERE (([password] = @password) AND ([username] = @username))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="password" Name="password" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="userName" Name="username" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Label ID="LoginMessage" runat="server" Text=""></asp:Label>
            </div>

        </div>
    </form>
</body>
</html>

<