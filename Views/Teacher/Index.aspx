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

    <h2>Teachers</h2>

    <form id="form1" runat="server">
        <table class="inlineForm">
            <tr>
                <td><input type="text" name="userID" id="userID" placeholder="User ID"/></td>
                <td><input type="text" name="firstName" id="firstName" placeholder="First Name"/></td>
                <td><input type="text" name="lastName" id="lastName" placeholder="Last Name"/></td>
            </tr>
        </table>
        <input type="submit" value="Add Teacher" />
    </form>
    
    <section class="content">
    <a id="show_hide_button">show all</a>
        <table class="zebra hasHeader small">
            <tbody>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Toggle Status</th>
                </tr>
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
    </section>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
    
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>

