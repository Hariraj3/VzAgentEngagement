using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Vz.AgentEngagement.Engine.Readers
{
    internal static class QueueReader
    {
        static string xmlFileName = "QueueInfo.xml";

        internal static List<QueueItem> GetQueueItems()
        {
            List<QueueItem> QueueItems = new List<QueueItem>();

            XDocument doc = XDocument.Load(Path.Combine(EngagementEngine.ContentPath, xmlFileName));

            var items = doc.Root.Elements("Queue");

            foreach(var item in items)
            {
                QueueItems.Add(new QueueItem()
                {
                    QueueId = Convert.ToString(item.Attribute("id").Value),
                    AgentsStaffed = Convert.ToInt32(item.Attribute("agentsStaffed").Value),
                    AgentsAvailable = Convert.ToInt32(item.Attribute("agentsAvailable").Value),
                    CallsInQueue = Convert.ToInt32(item.Attribute("callsInQueue").Value),
                    CallInRate = Convert.ToInt32(item.Attribute("callInRate").Value),
                    CurrentASA = Convert.ToInt32(item.Attribute("currentASA").Value),
                    CurrentAHT = Convert.ToInt32(item.Attribute("currentAHT").Value),
                    CurrentEWT = Convert.ToInt32(item.Attribute("currentEWT").Value)
                });
            }
            
            return QueueItems;
        }
    }
}
