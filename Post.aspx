<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Post.aspx.cs" Inherits="AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 729px;
            width: 1337px;
            margin-left: 200px;
        }
        #contentText {
            height: 77px;
            width: 321px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 703px">
            <br />
            <br />
            <input id="inputTitle" maxlength="20" type="text" value="Title" /><br />
            <br />
            <textarea id="contentText" maxlength="50" name="S1"></textarea><br />
            <br />
            <asp:FileUpload ID="FileUpload" runat="server" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Upload File" Height="23px" Width="94px" />
            <br />
            <br />
            <asp:Label ID="lblUploadMessage" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="buttonPost" runat="server" Text="Post" />
        </div>
    </form>
</body>
</html>
