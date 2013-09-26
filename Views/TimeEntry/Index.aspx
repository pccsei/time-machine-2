<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_14_TimeMachine2.Models.ENTRY>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Student Time Log
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .student_list {
            width:100%;
            margin:auto;
            
        }

        td, th, tr {
            padding:5px 10px 5px 10px;
        }

        th {
            width:auto;
            font-size:10pt;
        }

        tr:nth-child(even) {
            background-color:#ffffff;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Time Log</h2>

<div class="submit">
    <%: Html.ActionLink("Create New Entry", "Create") %>
</div>
<table class="student_list">
    <tr>
        <th>
            <%: Html.DisplayNameFor(model => model.PROJECT.project_name) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.entry_begin_time) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.entry_end_time) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.entry_total_time) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.LOCATION.location_name) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.CATEGORY.category_name) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.entry_work_accomplished) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.entry_comment) %>
        </th>

        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.PROJECT.project_name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.entry_begin_time) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.entry_end_time) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.entry_total_time) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.LOCATION.location_name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.CATEGORY.category_name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.entry_work_accomplished) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.entry_comment) %>
        </td>

        <td>
            <%: Html.ActionLink("Edit", "Edit", new {  id=item.entry_id  }) %> |
           <%-- <%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ }) %> |--%>
            <%: Html.ActionLink("Delete", "Delete", new {  id=item.entry_id  }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
