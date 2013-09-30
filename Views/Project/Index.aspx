<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_14_TimeMachine2.Models.PROJECT>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Projects
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server">
            <table>
                <tr><td>Project Name:        </td><td><input type="text" name="projectName" id="projectName"/></td></tr>

                <tr><td>Choose Course:       </td><td><%: Html.DropDownList("project_course_id",
                (SelectList)(ViewBag.project_course_id), "-- Select Course --", String.Empty) %></td></tr>

                <tr><td>Project Description: </td><td><input type="text" name="ProjectDescription"  id="ProjectDescription" /></td></tr>
            </table>
        <p>
            <input type="submit" value="Create Project" />
        </p>
    </form>
    
    <br /><br />
    <h2 style="display: inline;">Projects</h2> <a id="show_hide_button">show all</a>
<table class="zebra hasHeader">
    <tr>
        <th>
            <%: Html.DisplayNameFor(model => model.project_name) %>

        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.COURSE.course_name) %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr id="tr_<%= item.project_id %>" <% if (!item.is_enabled()) { %>class="disabled_entity"<% } %>>
        <td>
            <%: Html.DisplayFor(modelItem => item.project_name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.COURSE.course_name) %>
        </td>
   
        <td>
            <%: Html.ActionLink("edit", "edit", new {  id=item.project_id  }) %> |
            <a class="enable_disable_link" onclick="toggle_entity_enabled('<%= item.project_id  %>', '<%= Url.Action("ToggleEnabled", "Project")  %>')">disable</a>
            <%--<%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ }) %> |--%>
            <%--<%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ }) %>--%>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
