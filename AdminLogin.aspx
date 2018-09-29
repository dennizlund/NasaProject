<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<!DOCTYPE html>



<%--<html xmlns="http://www.w3.org/1999/xhtml">--%>
<html>

<head>
    <title>Page Title</title>
    <link rel="stylesheet" href="./css/AdminLogin.css" type="text/css">
</head>

<body>
    <form id="form1" runat="server">
        <div class="grid">
            <label for="userName">Username</label>
            <input runat="server" id="userName" type="text" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="userName"
                ErrorMessage="Username is a required field."
                ForeColor="Red">
            </asp:RequiredFieldValidator>
            <label for="password">Password</label>
            <input runat="server" id="password" type="password" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ControlToValidate="password"
                ErrorMessage="Password is a required field."
                ForeColor="Red">
            </asp:RequiredFieldValidator>
            <asp:Button ID="btnLogin" runat="server" OnClick="Button1_Click" Text="Login" />
            <asp:Button ID="btnBack" runat="server" OnClick="btnBack_OnClick" Text="Home" CausesValidation="False"/>
        </div>
    </form>
</body>
</html>
