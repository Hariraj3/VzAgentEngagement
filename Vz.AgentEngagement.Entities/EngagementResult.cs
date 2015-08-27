using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Vz.AgentEngagement.Entities
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
    }
}
