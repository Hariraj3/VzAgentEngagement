using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using Vz.AgentEngagement.Engine;

namespace Vz.AgentEngagement
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            EngagementEngine.Initialize(Server.MapPath("~/XML"));
        }
    }
}