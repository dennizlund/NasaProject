﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="livesearch.aspx.cs" Inherits="livesearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Articles] "></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
