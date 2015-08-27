using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Vz.AgentEngagement.Engine
{
    public class EngagementItem
    {
        public EngagementItemType ItemType
        {
            get;
            set;
        }

        public string Title
        {
            get;
            set;
        }

        public string Url
        {
            get;
            set;
        }

        public int Duration
        {
            get;
            set;
        }

        public override string ToString()
        {
            return string.Format("Type={0}, Title={1}, Url={2}, Duration={3}", ItemType, Title, Url, Duration);
        }
    }

    public enum EngagementItemType
    {
        Training,
        Followup
    }

}
