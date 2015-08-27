using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Vz.AgentEngagement.Entities
{
    public class EngagementItem
    {
        public EngagementItemType ItemType
        {
            get;
            set;
        }

        public string ItemTitle
        {
            get;
            set;
        }

        public string ItemUrl
        {
            get;
            set;
        }

        public int ItemDuration
        {
            get;
            set;
        }
    }

    public enum EngagementItemType
    {
        Training,
        Followup
    }

}
