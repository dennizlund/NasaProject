<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Post.aspx.cs" Inherits="AdminPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="./css/style.css" rel="stylesheet" />
    <script src="./javascript/AJAX.js"></script>
</head>
<body>
    <form id="form" runat="server" method="POST">
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
                        <asp:Button Text="Login" ID="btnLogin" OnClick="btnLogin_OnClick" runat="server" />
                    </div>

                </div>

            </div>
            <div class="loginArea">
                <h3>Title</h3>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO Articles(contentText, titleText, uploadSrc) VALUES (@content, @title, @source)" SelectCommand="AddArticle" SelectCommandType="StoredProcedure">
                    <InsertParameters>
                        <asp:Parameter Name="Content" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Source" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="inputTitle" Name="Title" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="inputContentUpdate" Name="Content" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="FileUpload" Name="Source" PropertyName="FileName" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <asp:TextBox ID="inputTitle" runat="server" MaxLength="20" CssClass="inputTitle"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server"
                    ControlToValidate="inputTitle"
                    ErrorMessage="Title is a required field."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <br />
                <br />
                <h3>Content</h3>
                <asp:TextBox ID="inputContentUpdate" runat="server" TextMode="multiline" Wrap="True" CssClass="inputContentUpdate"></asp:TextBox>
                <asp:RegularExpressionValidator runat="server" ID="valInput"
                    ControlToValidate="inputContentUpdate"
                    ForeColor="Red"
                    ValidationExpression="^[\s\S]{0,100}$"
                    ErrorMessage="Please enter a maximum of 100 characters"
                    Display="Dynamic">Please enter a maximum of 100 characters</asp:RegularExpressionValidator>

                <br />
                <br />
                <asp:FileUpload ID="FileUpload" runat="server" />
                &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Post Update" Height="23px" Width="94px" />
                <br />
                <br />
                <asp:Label ID="lblUploadMessage" runat="server"></asp:Label>
                <br />
                <br />
            </div>

        </div>
    </form>
</body>
</html>
