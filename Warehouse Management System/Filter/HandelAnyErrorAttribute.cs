using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Warehouse_Management_System.Filter;

namespace Warehouse_Management_System.Filter
{
    public class HandelAnyErrorAttribute : Attribute, IExceptionFilter
    {
        public void OnException(ExceptionContext context)
        {
            ViewResult view = new ViewResult();
            view.ViewName = "_ErrorLayout";

            context.Result = view;

            context.ExceptionHandled = true;
        }
    }
}
