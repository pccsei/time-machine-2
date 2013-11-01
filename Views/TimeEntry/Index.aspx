<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_14_TimeMachine2.Models.ENTRY>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Student Time Log
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Time Log</h2>

<div class="submit">
    <a class="create" href="<%: Url.Action("Create") %>">
        <img id="add" src="<%= Url.Action("PL_Add_1x.png", "Images")%>" alt="Create Entry" />
        Create New Entry
    </a>
</div>
<table class="zebra hasHeader tablesorter">
    <thead>
        <tr>
            <th>
                <%: Html.DisplayNameFor(model => model.PROJECT.project_name) %>
            </th>
            <th>
                Time Period
                <%--: Html.DisplayNameFor(model => model.entry_begin_time) --%>
            </th>
    <%--        <th>
                <%: Html.DisplayNameFor(model => model.entry_end_time) %>
            </th>--%>
            <th>
                <%: Html.DisplayNameFor(model => model.entry_total_time) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.LOCATION.location_name) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.CATEGORY.category_name) %>
            </th>
            <%--<th>
                <%: Html.DisplayNameFor(model => model.entry_work_accomplished) %>
            </th>--%>

            <th></th>
        </tr>
    </thead>
    <tbody>
    <% foreach (var item in Model.OrderByDescending(e => e.entry_end_time))
       { %>
    
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.PROJECT.project_name) %>
            </td>
            <td><span class="sort_criterion" style="display:none"><%: ((DateTime) item.entry_begin_time).ToString("yyyyMMddHHmmss") %></span>
                <%: ((DateTime) item.entry_begin_time).ToString("ddd. M/d h:mm tt") %> -
                <%: ((DateTime) item.entry_end_time).ToString("h:mm tt") %>
            </td>
    <%--        <td>
                <%: Html.DisplayFor(modelItem => item.entry_end_time) %>
            </td>--%>
            <td <% if ((float) item.entry_total_time / 60.0f > 4.0f) { %>style="color:#f90; font-style:italic"<% } %>>
                <%: ((float) item.entry_total_time / 60.0f).ToString("n2") %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.LOCATION.location_name) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.CATEGORY.category_name) %>
            </td>
            <%--<td>
                <%: Html.DisplayFor(modelItem => item.entry_work_accomplished) %>
            </td>--%>

            <td>
               <%: Html.ActionLink("More...", "Details", new { id=item.entry_id }) %>
            </td>
        </tr>
    <% } %>
    </tbody>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".tablesorter").tablesorter({
                headers: {
                    5: { sorter: false }
                },
                sortList: [[1,1]]
            });
        });
    </script>
</asp:Content>
