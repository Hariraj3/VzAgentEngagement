<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgentView.aspx.cs" Inherits="Vz.AgentEngagement.AgentView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Agent View</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <asp:PlaceHolder runat="server">
        <!-- Script block starts here -->
        <script src="<%: ResolveUrl("~/Content/Scripts/Libs/jquery-1.10.2.min.js") %>"></script>
        <script src="<%: ResolveUrl("~/Content/Scripts/Libs/bootstrap.min.js") %>"></script>
        <!-- Style block starts here -->
        <link href="<%: ResolveUrl("~/Content/Styles/cssbutton.css") %>" rel="stylesheet" />
        <link href="<%: ResolveUrl("~/Content/Styles/bootstrap.min.css") %>" rel="stylesheet" />
        <link href="<%: ResolveUrl("~/Content/Styles/bootstrap-responsive.min.css") %>" rel="stylesheet" />
        <link href="<%: ResolveUrl("~/Content/Styles/bootstrap-theme.min.css") %>" rel="stylesheet" />
        <link href="<%: ResolveUrl("~/Content/Styles/agentstyle.css") %>" rel="stylesheet" />
    </asp:PlaceHolder>


    <script type="text/javascript">
        var agentinfourl = '<%= ResolveUrl("AgentView.aspx/GetInfo") %>';
        var agentstatusurl = '<%= ResolveUrl("AgentView.aspx/updateAgentStatus") %>';
    </script>
</head>
<body>
    <form id="form1" runat="server">
        Welcome <br />
        <div id="divCall" style="width: 200px; height:100px; vertical-align: middle; background-color: gray;">
            <div id="divStatus" style="text-align: left">Status: ON CALL</div><br />
            <input id="btnStatus" type="button" class='yui3-button error' value="HANGUP" onclick="changestatus();" />
        </div>

        <div id="myModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Alert!!</h4>
            </div>
            <div class="modal-body col-xs-12">
                <div id="divMsg"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="ignorepop();">Ignore</button>
            </div>
        </div>
    </div>
</div>

        <input type="hidden" id="hdnFlag" value="N" />
        <input type="hidden" id="hdnTimer" value="0" />

    </form>
</body>
</html>
<script src="Content/Scripts/vz.agentview.js"></script>
