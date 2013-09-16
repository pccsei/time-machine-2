<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Manager
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<form action="Manager/Index" method="post">
    <fieldset>
        <legend></legend>
        <div class="field">
            <table>
                <tr>
                    <td> User ID:    <input type="text" id="userID"/></td>
                    <td> First Name: <input type="text" id="firstName"/></td>
                    <td> Last Name:  <input type="text" id="lastName" /></td>
                </tr>
            </table>
        </div>
    </fieldset>
    <input type="submit" value="Create Teacher">
</form>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>

