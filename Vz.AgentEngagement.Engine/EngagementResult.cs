using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Vz.AgentEngagement.Engine
{
    public class EngagementResult
    {
        public int FreeMinutes
        {
            get;
            set;
        }

        public List<EngagementItem> Items
        {
            get;
            set;
        }

        public override string ToString()
        {
            StringBuilder builder = new StringBuilder();

            builder.AppendFormat("Free Minutes = {0}", FreeMinutes);
            builder.AppendLine();

            foreach (var item in Items)
            {
                builder.AppendLine(item.ToString());
            }

            return builder.ToString();
        }
    }
}
