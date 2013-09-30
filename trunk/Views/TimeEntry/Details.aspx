<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<_14_TimeMachine2.Models.ENTRY>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<style type="text/css">

    td.display-label {
        font-weight: bold;
        padding-right: 15px;
        text-align: right;
    }

</style>

<h2>Details</h2>

    <table>
    <tr>
    <td class="display-label">
        Entry ID
        <!-- <%: Html.DisplayNameFor(model => model.entry_id) %> -->
    </td>
    <td class="display-field">
        <%: Html.DisplayFor(model => model.entry_id) %>
    </td>
    </tr>
    
    <tr>
    <td class="display-label">
        <%: Html.DisplayNameFor(model => model.entry_begin_time) %>
    </td>
    <td class="display-field">
        <%: Html.DisplayFor(model => model.entry_begin_time) %>
    </td>
    </tr>
    
    <tr>
    <td class="display-label">
        <%: Html.DisplayNameFor(model => model.entry_end_time) %>
    </td>
    <td class="display-field">
        <%: Html.DisplayFor(model => model.entry_end_time) %>
    </td>
    </tr>
    
    <tr>
    <td class="display-label">
        Minutes
        <!-- <%: Html.DisplayNameFor(model => model.entry_total_time) %> -->
    </td>
    <td class="display-field">
        <%: Html.DisplayFor(model => model.entry_total_time) %>
    </td>
    </tr>
    
    <tr>
    <td class="display-label">
        <%: Html.DisplayNameFor(model => model.entry_work_accomplished) %>
    </td>
    <td class="display-field">
        <%: Html.DisplayFor(model => model.entry_work_accomplished) %>
    </td>
    </tr>
    
    <tr>
    <td class="display-label">
        <%: Html.DisplayNameFor(model => model.entry_comment) %>
    </td>
    <td class="display-field">
        <%: Html.DisplayFor(model => model.entry_comment) %>
    </td>
    </tr>
    
    <tr>
    <td class="display-label">
        Student Name
        <!-- <%: Html.DisplayNameFor(model => model.USER.user_first_name) %> -->
    </td>
    <td class="display-field">
        <%: Html.DisplayFor(model => model.USER.user_first_name) %>
        <%: Html.DisplayFor(model => model.USER.user_last_name) %>
    </td>
    </tr>
    
    <tr>
    <td class="display-label">
        <%: Html.DisplayNameFor(model => model.PROJECT.project_name) %>
    </td>
    <td class="display-field">
        <%: Html.DisplayFor(model => model.PROJECT.project_name) %>
    </td>
    </tr>
    
    <tr>
    <td class="display-label">
        <%: Html.DisplayNameFor(model => model.LOCATION.location_name) %>
    </td>
    <td class="display-field">
        <%: Html.DisplayFor(model => model.LOCATION.location_name) %>
    </td>
    </tr>
    
    <tr>
    <td class="display-label">
        <%: Html.DisplayNameFor(model => model.CATEGORY.category_name) %>
    </td>
    <td class="display-field">
        <%: Html.DisplayFor(model => model.CATEGORY.category_name) %>
    </td>
    </tr>
    </table>

<p>
    <%: Html.ActionLink("Edit", "Edit", new { id = Model.entry_id }) %> |
    <%: Html.ActionLink("Delete", "Delete", new {  id = Model.entry_id  }) %> | 
    <%: Html.ActionLink("Back to Timelog", "Index") %>
</p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
