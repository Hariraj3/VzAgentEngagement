using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vz.AgentEngagement.Engine.Readers;

namespace Vz.AgentEngagement.Engine
{
    public static class EngagementEngine
    {
        internal static string ContentPath
        {
            get;
            private set;
        }

        public static void Initialize(string contentPath)
        {
            ContentPath = contentPath;
        }

        public static EngagementResult GetEngagement(EngagementRequest request)
        {
            EngagementResult result = new EngagementResult();

            string agentId = request.AgentId;
            var agentItem = AgentReader.GetAgentItems().First(i => i.AgentId.Equals(agentId, StringComparison.OrdinalIgnoreCase));

            string[] queues = agentItem.QueueList;
            string queueId = queues[0];

            QueueItem queueItem = QueueReader.GetQueueItems().First(q => q.QueueId.Equals(queueId, StringComparison.OrdinalIgnoreCase));

            AgentEngagementManager engagementManager = new AgentEngagementManager();
            int freeMinutes = engagementManager.CalculateFreeMinutes(agentId, queueItem);

            result.FreeMinutes = freeMinutes;
            result.Items = EngagementReader.GetEngagementItems(freeMinutes);
            
            return result;
        }
    }
}
