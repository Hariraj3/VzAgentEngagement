using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Vz.AgentEngagement.Engine
{
    public class QueueItem
    {
        public string QueueId
        {
            get;
            set;
        }

        public int AgentsStaffed
        {
            get;
            set;
        }

        public int AgentsAvailable
        {
            get;
            set;
        }

        public int CallsInQueue {
            get;
            set;
        }

        public int CallInRate
        {
            get;
            set;
        }

        public int CurrentASA
        {
            get;
            set;
        }

        public int CurrentAHT
        {
            get;
            set;
        }

        public int CurrentEWT
        {
            get;
            set;
        }

    }

}
