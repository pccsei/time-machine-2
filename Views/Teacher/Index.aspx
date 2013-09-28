<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_14_TimeMachine2.Models.USER>>" %>

<script runat="server">
    protected void submitButton_Click(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Manager
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server">
    <fieldset>
        <legend></legend>
        <div class="field">
            <table>
                <tr><td>User ID:   </td><td><input type="text" name="userID"    id="userID"/></td></tr>
                <tr><td>First Name:</td><td><input type="text" name="firstName" id="firstName"/></td></tr>
                <tr><td>Last Name: </td><td><input type="text" name="lastName"  id="lastName" /></td></tr>
            </table>
        </div>
    </fieldset>
        <p>
            <input type="submit" value="Create Teacher" />
        </p>
        <%--<asp:Button ID="submitButton" runat="server" Text="Create Teacher" OnClick="submitButton_Click" />--%>
    </form>
    
    <br /><br />
    <h2 style="display: inline;">Teachers</h2> <a id="show_hide_button">show all</a>

    <table class="standard">
        <tbody>
            <% foreach (var user in Model.ToArray())
               { 
                   if (user.is_teacher())
                   { %>
                <tr id="tr_<%= user.user_id %>" <% if (!user.is_enabled()) { %>class="disabled_entity"<% } %>>
                    <td><%= user.user_id  %></td>
                    <td><%= user.user_first_name  %> <%= user.user_last_name %></td>
                    <td><a class="enable_disable_link" onclick="toggle_entity_enabled('<%= user.user_id  %>', '<%= Url.Action("ToggleEnabled", "Teacher")  %>')">disable</a></td>
                </tr>
            <% }} %>
        </tbody>
    </table>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
    
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>

