<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Login
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Login</h2>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">



</asp:Content>




<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
        <form id="loginForm" runat="server">
            
            <asp:TextBox Placeholder="Your user name" ID="loginName" runat="server" style="width:120px" BorderColor="Green" /> <br />
            <asp:Label ID="lblLoginError" ForeColor="Red" runat="server"/><br />
            <asp:TextBox Placeholder="Password" ID="loginPass" runat="server" style="width:120px" BorderColor="Green" /> <br />
            <!--MESSAGE FROM NOAH: Did you use the http post html helper above your function? Forms use post as default"-->
            <!-- TODO: cannot figure out how to get OnClick function below to work -->
            <asp:Button ID="loginButton" Text="Login" OnClick="testFields" runat="server" />            
    </form>
</asp:Content>
