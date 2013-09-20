<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    LoginButtonClick
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>LoginButtonClick</h2>


    
      <div class="login">
          <p>
             Welcome to project time machine! <br />
             Please input your Username and Password to start logging the past!<br />
          </p>
          <div style="margin: 0px auto 0px auto; text-align: center;">
             <form id="form1" runat="server">
                 <asp:Label ID="lbl_error_message" ForeColor="Red" runat="server" />
             
                  Username:&nbsp <asp:TextBox ID="txt_username" runat="server" style="width:80px" /><br />
                  Password:&nbsp&nbsp <asp:TextBox ID="txt_password" TextMode="Password" runat="server" style="width:80px" /><br /><br />
                 <asp:Button ID="LoginButton" OnClick="LoginButtonClick" Text="Login" runat="server" />
             
             </form>
          </div>
      </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
