<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Post.aspx.cs" Inherits="AdminPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="./css/style.css" rel="stylesheet" />
    <%--<style type="text/css">
        #form1 {
            height: 729px;
            width: 1337px;
            margin-left: 200px;
        }

        #contentText {
            height: 77px;
            width: 321px;
        }
    </style>--%>
</head>
<body>
    <div class="grid">
        <form id="form" runat="server" method="POST">
            <div class="boxText">
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
        </form>
    </div>
</body>
</html>
