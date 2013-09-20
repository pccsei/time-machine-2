using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _14_TimeMachine2.Controllers;

namespace _14_TimeMachine2Tests.Controllers
{
     [TestClass]
     public class HomeControllerTest
     {
          [TestMethod]
          public void TestDetailsView()
          {
               var controller = new HomeController();
               var result = controller.Details(2) as ViewResult;
               Assert.AreEqual("Details", result.ViewName);

          }
     }
}
