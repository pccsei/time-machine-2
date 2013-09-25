using System;//.Web;
using System.Web.Mvc;
using _14_TimeMachine2.Filters;

namespace _14_TimeMachine2
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new AuthorizeUserAttribute());
            //filters.Add(new AuthorizeUserAttribute());
        }
    }
}