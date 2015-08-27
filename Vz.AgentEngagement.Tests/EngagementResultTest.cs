using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Vz.AgentEngagement.Engine;

namespace Vz.AgentEngagement.Tests
{
    [TestClass]
    public class EngagementResultTest
    {
        [TestMethod]
        public void TestMethod1()
        {
            EngagementEngine.Initialize(@"D:\Vz.AgentEngagement\Vz.AgentEngagement\XML\");
            EngagementResult objEngagementResult = EngagementEngine.GetEngagement(new EngagementRequest { AgentId = "Agent1" });
            Assert.AreEqual(2, objEngagementResult.FreeMinutes);
            

        }
    }
}
