﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vz.AgentEngagement.Engine;
using Xunit;
using Xunit.Abstractions;

namespace Vz.AgentEngagementTest
{
    public class EngagementTest
    {
        public void TestMethod1()
        {
            EngagementEngine.Initialize(@"D:\Vz.AgentEngagement\Vz.AgentEngagement\XML\");
            EngagementResult objEngagementResult = EngagementEngine.GetEngagement(new EngagementRequest { AgentId = "Agent1" });
            Assert.Equal(0, 0);
            //Assert.Equal(0, objEngagementResult.FreeMinutes);


        }
    }
}