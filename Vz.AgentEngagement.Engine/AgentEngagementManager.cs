using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Vz.AgentEngagement.Engine {

    internal class AgentEngagementManager {

        const int EWT_THRESHOLD = 300;
        const int ASA_THRESHOLD = 90;
        const int AHT_THRESHOLD = 1800;
        const int MIN_FREEMINUTES = 0;
        const int MAX_FREEMINUTES = 10;

        internal int CalculateFreeMinutes(string agentId, QueueItem queueItem) {
            int freeMinutes = 0;

            if (queueItem.CurrentEWT >= EWT_THRESHOLD
                || queueItem.CurrentASA >= ASA_THRESHOLD
                || queueItem.CurrentAHT >= AHT_THRESHOLD) {
                freeMinutes = 0;
            } else {
                int callsWaiting = queueItem.CallsInQueue - queueItem.AgentsAvailable;
                int delta = MAX_FREEMINUTES - MIN_FREEMINUTES;

                if (callsWaiting > queueItem.AgentsStaffed) {
                    freeMinutes = 0;
                } else if (queueItem.AgentsAvailable == 0) {
                    freeMinutes = 0;
                } else { 
                    int loadFactor = queueItem.CallsInQueue * 100 / queueItem.AgentsAvailable;

                    if (loadFactor >= 0 && loadFactor <= 20) {
                        freeMinutes = delta;
                    } else if (loadFactor <= 40) {
                        freeMinutes = Convert.ToInt32(delta * 0.8);
                    } else if (loadFactor <= 60) {
                        freeMinutes = Convert.ToInt32(delta * 0.6);
                    } else if (loadFactor <= 80) {
                        freeMinutes = Convert.ToInt32(delta * 0.4);
                    } else if (loadFactor <= 100) {
                        freeMinutes = Convert.ToInt32(delta * 0.2);
                    } else {
                        freeMinutes = 0;
                    }
                }
            }

            return freeMinutes;
        }

    }

}