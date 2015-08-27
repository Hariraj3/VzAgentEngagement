$(document).ready(function () {
    
    start();
    //$('.modal-backdrop').removeClass("modal-backdrop");
	setInterval(function () { start(); }, 10000);
})


function ignorepop()
{
    var curtime = $('#divFreeMin').text();
    var dt = (new Date).getTime();
    $('#hdnTimer').val(dt + (parseInt(curtime) * 60000));
    
    
}

function start() {
	
    if($('#btnStatus').val() != "AVAILABLE")
    {
        return;
    }

    var currentTime = (new Date).getTime();
    var prevTime = parseInt($('#hdnTimer').val());

    if (currentTime >= prevTime)
    {
        $('#hdnTimer').val("0");
    }
    else
    {
        return;
    }
    
    var agentid = GetParameterValues('id');

	$.ajax({
		type: "POST",
		//url: "TestPage.aspx/Test",
		url: agentinfourl,
		data: '{"agentid": "' + agentid + '" }',
		contentType: "application/json;charset=utf-8",
		dataType: "json",
		success: function (msg) {
		    if (msg.d != "") {
		        $('#divMsg').html(msg.d);
		        $("#myModal").modal('show');
		        $('.modal-backdrop').removeClass("modal-backdrop");
		    }
		}
	});
}

$('#myModal').on('hide', function (e) {
        e.preventDefault();
});

function startTraining(url, mode)
{
    window.open(url);
    var agentid = GetParameterValues('id');
	$('#btnStatus').val("IN TRAINING");
	$("#btnStatus").removeClass();
	$("#btnStatus").addClass("yui3-button warning");
	$('#divStatus').html("Status: IN TRAINING");

	updatestatus(agentid, "IN TRAINING");

	//$('#myModal').modal('hide');
	//$('body').removeClass('modal-open');
	//$('.modal-backdrop').remove();
	//$("div.modal-backdrop").remove();

}

function changestatus()
{
    var agentid = GetParameterValues('id');
    var agentstatus = "";
	var callStatus = $('#btnStatus').val();
	if (callStatus == "HANGUP")
	{
		$('#btnStatus').val("AVAILABLE");
		$("#btnStatus").removeClass();
		$("#btnStatus").addClass("yui3-button success");
		$('#divStatus').html("Status: AVAILABLE");
		agentstatus = "AVAILABLE";
	}
	else if (callStatus == "ON CALL")
	{
		$('#btnStatus').val("HANGUP");
		$("#btnStatus").removeClass();
		$("#btnStatus").addClass("yui3-button error");
		$('#divStatus').html("Status: HANGUP");
		agentstatus = "ON CALL";
	}
	else if (callStatus == "IN TRAINING")
	{
		$('#btnStatus').val("AVAILABLE");
		$("#btnStatus").removeClass();
		$("#btnStatus").addClass("yui3-button error");
		$('#divStatus').html("Status: AVAILABLE");
		agentstatus = "AVAILABLE";
	}

	updatestatus(agentid, agentstatus);
}

function updatestatus(agentid, status)
{
    $.ajax({
        type: "POST",
        //url: "TestPage.aspx/Test",
        url: agentstatusurl,
        data: '{"agentid": "' + agentid + '", "status": "' + status + '" }',
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (msg) {
            //if (msg != "") {
            //    $('#divMsg').html(msg.d);
            //    $("#myModal").modal('show');
            //}
        }
    });
}


function GetParameterValues(param) {   
var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');   
   for (var i = 0; i < url.length; i++) {   
        var urlparam = url[i].split('=');   
         if (urlparam[0] == param) {   
                return urlparam[1];   
        }   
  }   
}
