using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using Vz.AgentEngagement.Engine;

namespace Vz.AgentEngagement.Models
{
    public class AgentModel
    {
        public EngagementResult getAgentStatus(string strAgentID)
        {
            
            EngagementResult objEngagementResult = EngagementEngine.GetEngagement(new EngagementRequest { AgentId = strAgentID });
            return objEngagementResult;
            //EngagementResult objEngagementResult = new EngagementResult();

            //List<EngagementItem> lstEngagementItem = new List<EngagementItem>();
            //lstEngagementItem.Add(new EngagementItem{ ItemDuration = 10, ItemUrl="http://in.msn.com", ItemType = EngagementItemType.Training, ItemTitle = "Mobile Coach"});
            //lstEngagementItem.Add(new EngagementItem { ItemDuration = 10, ItemUrl = "http://in.msn.com", ItemType = EngagementItemType.Training, ItemTitle = "Support Info" });
            //lstEngagementItem.Add(new EngagementItem { ItemDuration = 10, ItemUrl = "http://in.msn.com", ItemType = EngagementItemType.Training, ItemTitle = "IPACD" });

            //lstEngagementItem.Add(new EngagementItem { ItemDuration = 10, ItemUrl = "http://in.msn.com", ItemType = EngagementItemType.Followup, ItemTitle = "Past Due: 10" });
            //lstEngagementItem.Add(new EngagementItem { ItemDuration = 10, ItemUrl = "http://in.msn.com", ItemType = EngagementItemType.Followup, ItemTitle = "Past Due: 20" });
            //lstEngagementItem.Add(new EngagementItem { ItemDuration = 10, ItemUrl = "http://in.msn.com", ItemType = EngagementItemType.Followup, ItemTitle = "Past Due: 30" });
            //objEngagementResult.FreeMinutes = 1;
            //objEngagementResult.Items = lstEngagementItem;
            //return objEngagementResult;
        }


        public void updateAgentAUXStatus(string strAgentID, string strStatus)
        {
            XmlDocument xDoc = null;
            XmlTextReader xmlReader = null;
            try
            {
                xDoc = new XmlDocument();
                xmlReader = new XmlTextReader(HttpContext.Current.Server.MapPath("~/XML/AgentInfo.xml"));
                xDoc.Load(xmlReader);
                XmlNodeList nodes = xDoc.SelectNodes("Agents/Agent");

                foreach (XmlNode node in nodes)
                {
                    //if (node.Attributes["id"].Value.ToString() == strAgentID)
                    if (string.Compare(node.Attributes["id"].Value.ToString(), strAgentID, true) == 0)
                    {
                        // Set the new value
                        node.Attributes["status"].Value = strStatus;
                        break;
                    }
                }

                if (xmlReader != null)
                {
                    xmlReader.Close();
                    xmlReader = null;
                }

                xDoc.Save(HttpContext.Current.Server.MapPath("~/XML/AgentInfo.xml"));

            }
            catch(Exception exp)
            {
                throw exp;
            }
            finally
            {
                if (xmlReader != null)
                {
                    xmlReader.Close(); 
                    xmlReader = null;
                }
                xDoc = null;
            }
        }
    }
}