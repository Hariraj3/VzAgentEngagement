using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vz.AgentEngagement.Engine;
using NUnit.Framework;
using System.IO;

namespace Vz.AgentEngagement.Tests
{
    [TestFixture]
    public class EngagementTest
    {
        [Test]
        public void TestMethod1()
        {
            //EngagementEngine.Initialize(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Content" @"D:\Vz.AgentEngagement\Vz.AgentEngagement\XML\");
            EngagementEngine.Initialize(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "XML"));
            EngagementResult objEngagementResult = EngagementEngine.GetEngagement(new EngagementRequest { AgentId = "Agent1" });
            Assert.AreEqual(0, objEngagementResult.FreeMinutes);
        }
    }
}
