using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using Vz.AgentEngagement.Models;
using Vz.AgentEngagement.Engine;


namespace Vz.AgentEngagement
{
    public partial class AgentView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [System.Web.Services.WebMethod]
        public static string GetInfo(string agentid)
        {
            EngagementRequest objEngagementRequest = null;
            AgentModel objAgentModel = null;
            EngagementResult objEngagementResult = null;
            StringBuilder sb = null;
            try
            {
                //Form Request
                objEngagementRequest = new EngagementRequest();
                objEngagementRequest.AgentId = agentid;

                objAgentModel = new AgentModel();

                objEngagementResult = objAgentModel.getAgentStatus(agentid);

                if (objEngagementResult != null)
                {
                    if (objEngagementResult.FreeMinutes == 0)
                    {
                        return string.Empty;
                    }

                    sb = new StringBuilder();
                    sb.Append("<div style='font-size: 20px; padding-bottom:10px'> You have <span id='divFreeMin'>" + objEngagementResult.FreeMinutes.ToString() + "</span> free minutes left... What would you like to do?</div>");
                    var lstTrainingEngagement = objEngagementResult.Items.Where(x => x.ItemType == EngagementItemType.Training);
                    if (lstTrainingEngagement != null)
                    {
                        //sb.Append("<div class='left-div'><b>Training<b><ul>");
                        sb.Append("<div class='col-xs-6'><h5>Training<h5><ul class='list-group'>");
                        foreach (EngagementItem obj in lstTrainingEngagement)
                        {
                            if(!string.IsNullOrEmpty(obj.Url))
                            {
                                sb.Append("<li class='list-group-item'><a data-dismiss='modal' onclick=\"startTraining('" + obj.Url + "','TRAINING');\">" + obj.Title + " - " + obj.Duration + "</a></li>");
                            }
                            else
                            {
                                sb.Append("<li class='list-group-item'>" + obj.Title + " - " + obj.Duration + "</li>");
                            }
                        }
                        sb.Append("</ul></div>");
                    }


                    var lstFollowupEngagement = objEngagementResult.Items.Where(x => x.ItemType == EngagementItemType.Followup);
                    if (lstFollowupEngagement != null)
                    {
                        sb.Append("<div class='col-xs-6'><h5>Followup</h5><ul class='list-group'>");
                        foreach (EngagementItem obj in lstFollowupEngagement)
                        {
                            if (!string.IsNullOrEmpty(obj.Url))
                            {
                                sb.Append("<li class='list-group-item'><a data-dismiss='modal' onclick=\"startTraining('" + obj.Url + "','FOLLOWUP');\">" + obj.Title + "</a></li>");
                            }
                            else
                            {
                                sb.Append("<li class='list-group-item'>" + obj.Title + "</li>");
                            }
                        }
                        sb.Append("</ul></div>");
                    }
                    return sb.ToString();
                }
                return string.Empty;
            }
            catch(Exception exp)
            {
                return exp.Message.ToString();
            }
            finally
            {

            }
            
            
            /*
            try 
	        {	        
		        
                sb.Append("<div class='left-div'>Training<ul>");
                sb.Append("<li>sdfsdf</li>");
                sb.Append("<li>sdfsdf</li>");
                sb.Append("<li>sdfsdf</li>");
                sb.Append("</div>");
                sb.Append("<div class='right-div'>Follow up<ul>");
                sb.Append("<li>sdfsdf</li>");
                sb.Append("<li>sdfsdf</li>");
                sb.Append("<li>sdfsdf</li>");
                sb.Append("</div>");
	        }
            catch(Exception exp)
            {
                return exp.Message.ToString();
            }
            return sb.ToString();
            */
        }

        [System.Web.Services.WebMethod]
        public static void updateAgentStatus(string agentid, string status)
        {
            AgentModel objAgentModel = new AgentModel();
            objAgentModel.updateAgentAUXStatus(agentid, status);
        }
    }
}