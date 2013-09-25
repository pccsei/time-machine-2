<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page - My ASP.NET MVC Application
</asp:Content>

<asp:Content ID="indexFeatured" ContentPlaceHolderID="FeaturedContent" runat="server">
    <form id="form1" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Home Page.</h1>
                <h2><%: ViewBag.Message %>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="category_id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                        <Columns>
                            <asp:BoundField DataField="category_id" HeaderText="category_id" ReadOnly="True" SortExpression="category_id" />
                            <asp:BoundField DataField="category_name" HeaderText="category_name" SortExpression="category_name" />
                            <asp:BoundField DataField="category_created_on" HeaderText="category_created_on" SortExpression="category_created_on" />
                            <asp:BoundField DataField="category_created_by" HeaderText="category_created_by" SortExpression="category_created_by" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TM2Connection %>" DeleteCommand="DELETE FROM [CATEGORY] WHERE [category_id] = @category_id" InsertCommand="INSERT INTO [CATEGORY] ([category_name], [category_created_on], [category_created_by]) VALUES (@category_name, @category_created_on, @category_created_by)" SelectCommand="SELECT * FROM [CATEGORY]" UpdateCommand="UPDATE [CATEGORY] SET [category_name] = @category_name, [category_created_on] = @category_created_on, [category_created_by] = @category_created_by WHERE [category_id] = @category_id">
                        <DeleteParameters>
                            <asp:Parameter Name="category_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="category_name" Type="String" />
                            <asp:Parameter Name="category_created_on" Type="DateTime" />
                            <asp:Parameter Name="category_created_by" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="category_name" Type="String" />
                            <asp:Parameter Name="category_created_on" Type="DateTime" />
                            <asp:Parameter Name="category_created_by" Type="String" />
                            <asp:Parameter Name="category_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </h2>
            </hgroup>
        </div>
    </section>
</form>
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <!--<h3>We suggest the following:</h3>
    <ol class="round">
        <li class="one">
            <h5>Getting Started</h5>
            ASP.NET MVC gives you a powerful, patterns-based way to build dynamic websites that
            enables a clean separation of concerns and that gives you full control over markup
            for enjoyable, agile development. ASP.NET MVC includes many features that enable
            fast, TDD-friendly development for creating sophisticated applications that use
            the latest web standards.
            <a href="http://go.microsoft.com/fwlink/?LinkId=245151">Learn more…</a>
        </li>

        <li class="two">
            <h5>Add NuGet packages and jump-start your coding</h5>
            NuGet makes it easy to install and update free libraries and tools.
            <a href="http://go.microsoft.com/fwlink/?LinkId=245153">Learn more…</a>
        </li>

        <li class="three">
            <h5>Find Web Hosting</h5>
            You can easily find a web hosting company that offers the right mix of features
            and price for your applications.
            <a href="http://go.microsoft.com/fwlink/?LinkId=245157">Learn more…</a>
        </li>
    </ol>-->
</asp:Content>
