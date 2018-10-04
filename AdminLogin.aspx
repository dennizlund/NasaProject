<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<!DOCTYPE html>

<%--<html xmlns="http://www.w3.org/1999/xhtml">--%>
<html>

<head>
    <title>Page Title</title>
    <link rel="stylesheet" href="./css/style.css" type="text/css">
</head>

<body>
    <div class="grid">
        <div class="news_feed">
            <form id="form1" runat="server">
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NasaDatabaseConnectionString %>" SelectCommand="SELECT * FROM [UserAccounts]"></asp:SqlDataSource>
                <br />
                <asp:Label ID="LoginMessage" runat="server" Text=""></asp:Label>
            </form>
        </div>
        
    </div>
</body>
</html>
