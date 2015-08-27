using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Vz.AgentEngagement.Engine.Readers
{
    public static class AgentReader
    {
        static string xmlFileName = "AgentInfo.xml";

        public static List<AgentItem> GetAgentItems()
        {
            List<AgentItem> AgentItems = new List<AgentItem>();

            XDocument doc = XDocument.Load(Path.Combine(EngagementEngine.ContentPath, xmlFileName));

            var items = doc.Root.Elements("Agent");

            foreach(var item in items)
            {
                AgentItems.Add(new AgentItem()
                {
                    AgentId = Convert.ToString(item.Attribute("id").Value),
                    QueueList = Convert.ToString(item.Attribute("queues").Value).Split(',')
                });
            }
            
            return AgentItems;
        }
    }
}
