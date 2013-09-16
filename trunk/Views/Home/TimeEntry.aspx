<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<_14_TimeMachine2.Models.ENTRY>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    TimeEntry
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server">

    <h2>TimeEntry</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>ENTRY</legend>

        <div class="editor-label">
           
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.entry_user_id) %>
            <%: Html.ValidationMessageFor(model => model.entry_user_id) %>

        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.entry_project_id) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.entry_project_id) %>
            <%: Html.ValidationMessageFor(model => model.entry_project_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.entry_begin_time) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.entry_begin_time) %>
            <%: Html.ValidationMessageFor(model => model.entry_begin_time) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.entry_end_time) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.entry_end_time) %>
            <%: Html.ValidationMessageFor(model => model.entry_end_time) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.entry_location_id) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.entry_location_id) %>
            <%: Html.ValidationMessageFor(model => model.entry_location_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.entry_category_id) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.entry_category_id) %>
            <%: Html.ValidationMessageFor(model => model.entry_category_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.entry_work_accomplished) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.entry_work_accomplished) %>
            <%: Html.ValidationMessageFor(model => model.entry_work_accomplished) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.entry_comment) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.entry_comment) %>
            <%: Html.ValidationMessageFor(model => model.entry_comment) %>
        </div>

        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="entry_id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="entry_begin_time" HeaderText="entry_begin_time" SortExpression="entry_begin_time" />
            <asp:BoundField DataField="entry_end_time" HeaderText="entry_end_time" SortExpression="entry_end_time" />
            <asp:BoundField DataField="entry_total_time" HeaderText="entry_total_time" SortExpression="entry_total_time" />
            <asp:BoundField DataField="entry_work_accomplished" HeaderText="entry_work_accomplished" SortExpression="entry_work_accomplished" />
            <asp:BoundField DataField="entry_comment" HeaderText="entry_comment" SortExpression="entry_comment" />
            <asp:BoundField DataField="entry_user_id" HeaderText="entry_user_id" SortExpression="entry_user_id" />
            <asp:BoundField DataField="entry_project_id" HeaderText="entry_project_id" SortExpression="entry_project_id" />
            <asp:BoundField DataField="entry_location_id" HeaderText="entry_location_id" SortExpression="entry_location_id" />
            <asp:BoundField DataField="entry_category_id" HeaderText="entry_category_id" SortExpression="entry_category_id" />
            <asp:BoundField DataField="entry_id" HeaderText="entry_id" InsertVisible="False" ReadOnly="True" SortExpression="entry_id" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SEI_TimeMachine2ConnectionString %>" DeleteCommand="DELETE FROM [ENTRY] WHERE [entry_id] = @entry_id" InsertCommand="INSERT INTO [ENTRY] ([entry_begin_time], [entry_end_time], [entry_total_time], [entry_work_accomplished], [entry_comment], [entry_user_id], [entry_project_id], [entry_location_id], [entry_category_id]) VALUES (@entry_begin_time, @entry_end_time, @entry_total_time, @entry_work_accomplished, @entry_comment, @entry_user_id, @entry_project_id, @entry_location_id, @entry_category_id)" SelectCommand="SELECT [entry_begin_time], [entry_end_time], [entry_total_time], [entry_work_accomplished], [entry_comment], [entry_user_id], [entry_project_id], [entry_location_id], [entry_category_id], [entry_id] FROM [ENTRY]" UpdateCommand="UPDATE [ENTRY] SET [entry_begin_time] = @entry_begin_time, [entry_end_time] = @entry_end_time, [entry_total_time] = @entry_total_time, [entry_work_accomplished] = @entry_work_accomplished, [entry_comment] = @entry_comment, [entry_user_id] = @entry_user_id, [entry_project_id] = @entry_project_id, [entry_location_id] = @entry_location_id, [entry_category_id] = @entry_category_id WHERE [entry_id] = @entry_id">
        <DeleteParameters>
            <asp:Parameter Name="entry_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="entry_begin_time" Type="DateTime" />
            <asp:Parameter Name="entry_end_time" Type="DateTime" />
            <asp:Parameter Name="entry_total_time" Type="Int32" />
            <asp:Parameter Name="entry_work_accomplished" Type="String" />
            <asp:Parameter Name="entry_comment" Type="String" />
            <asp:Parameter Name="entry_user_id" Type="String" />
            <asp:Parameter Name="entry_project_id" Type="Int32" />
            <asp:Parameter Name="entry_location_id" Type="Int32" />
            <asp:Parameter Name="entry_category_id" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="entry_begin_time" Type="DateTime" />
            <asp:Parameter Name="entry_end_time" Type="DateTime" />
            <asp:Parameter Name="entry_total_time" Type="Int32" />
            <asp:Parameter Name="entry_work_accomplished" Type="String" />
            <asp:Parameter Name="entry_comment" Type="String" />
            <asp:Parameter Name="entry_user_id" Type="String" />
            <asp:Parameter Name="entry_project_id" Type="Int32" />
            <asp:Parameter Name="entry_location_id" Type="Int32" />
            <asp:Parameter Name="entry_category_id" Type="Int32" />
            <asp:Parameter Name="entry_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>

    </form>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
