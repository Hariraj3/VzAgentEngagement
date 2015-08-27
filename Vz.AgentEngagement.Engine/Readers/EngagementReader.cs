using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Vz.AgentEngagement.Engine.Readers
{
    internal static class EngagementReader
    {
        static string xmlFileName = "EngagementInfo.xml";

        internal static List<EngagementItem> GetEngagementItems(int maxDuration)
        {
            List<EngagementItem> engagementItems = new List<EngagementItem>();

            XDocument doc = XDocument.Load(Path.Combine(EngagementEngine.ContentPath, xmlFileName));

            var items = doc.Root.Elements("Item");

            foreach(var item in items)
            {
                int duration = Convert.ToInt32(item.Attribute("duration").Value);

                if (duration <= maxDuration)
                {
                    engagementItems.Add(new EngagementItem()
                    {
                        ItemType = (EngagementItemType)Enum.Parse(typeof(EngagementItemType), item.Attribute("type").Value, true),
                        Duration = duration,
                        Title = Convert.ToString(item.Attribute("title").Value),
                        Url = Convert.ToString(item.Attribute("url").Value)
                    });
                }
            }
            
            return engagementItems;
        }
    }
}
