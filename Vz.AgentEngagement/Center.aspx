<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Center.aspx.cs" Inherits="Vz.AgentEngagement.Center" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Content/Scripts/Libs/jquery-1.10.2.min.js"></script>
    <script src="Content/Scripts/Libs/jquery.layout.js"></script>
    <script src="Content/Scripts/Libs/highcharts.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('body').layout({ applyDefaultStyles: true });

            //codepedia.info/2015/07/highcharts-asp-net-create-pie-chart-with-jquery-ajax-in-c-sharp-ms-sql-database/
            //www.tutorialized.com/tutorial/Charts-and-graphs-using-jquery-and-charting-library-the-HighCharts/67976
            //jsfiddle.net/gh/get/jquery/1.7.2/highslide-software/highcharts.com/tree/master/samples/highcharts/plotoptions/series-point-events-click/
            //$('.rcorners').toggle(function () {
            //    $(".rcorners").addClass("active");
            //}, function () {
            //    $(".rcorners").removeClass("active");
            //});

            $(".rcorners").click(function () {
                $('p').removeClass('active');
                $(this).addClass('active');
            });


            


            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Service.asmx/FruitAnalysis2",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    //alert(Result.d.UserName);
                    //alert(Result.d.UserValue);
                    //Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    //DreawChart(data);
                    var seriesOne = new Array();
                    var seriesTwo = new Array();
                    seriesOne = Result.d.UserName;//.split(',');
                    //for (var i = 0; i < seriesOne.length; i++) {
                    //    seriesOne[i] = parseInt(seriesOne[i]);
                    //}

                    seriesTwo = Result.d.UserValue;//.split(',');
                    DreawChart(seriesOne, seriesTwo);
                },
                error: function (Result) {
                    alert("Error");
                }
            });

        });

        function DreawChart(uname, uvalue) {
            var arr = []
            $.map(uvalue, function (item, index) {
                arr.push(parseInt(item));
            });

            
            $('#container').highcharts({
                chart: {
                    type: 'bar'
                },
                title: {
                    text: 'Stacked column chart'
                },
                xAxis: {
                    categories: uname,
                    labels: {
                        style: {
                            cursor: 'pointer',
                            fontSize: '14px'
                        },
                    events: {
                            click: function(e)
                            {
                                alert('adfasdfasdf');
                                console.log(e.xAxis[0].value);
                                alert(e.xAxis[0].value);
                                //ajax post
                            }
                        }
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Total fruit consumption'
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                },
               
                tooltip: {
                    shared: true,
                    formatter: function () {
                        var ind = uname.indexOf(this.x);
                        var s;
                        $.each(this.points, function (i, point) {
                            //s += point.series.options.composition[ind];
                            s = "Name: " + point.x;
                        });
                        return s;
                    }
                    //headerFormat: '<b>{point.x}</b><br/>',
                    //pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
                },
                plotOptions: {
                    column: {
                        stacking: 'percent',
                        dataLabels: {
                            enabled: true,
                            color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                            style: {
                                textShadow: '0 0 3px black'
                            }
                        }
                    }
                },
                series: [{
                    name: 'ss',
                    data: arr
                }

                //, {
                //    name: 'Jane',
                //    data: [2, 2, 3, 2, 1]
                //}, {
                //    name: 'Joe',
                //    data: [3, 4, 4, 2, 5]
                //}
                ]



            });
        }


        $('.highcharts-xaxis-labels text').on('click', function () {
            console.log($(this).text());
            alert($(this).text());
        });


        //$(function () {
        //    $('#container2').highcharts({
        //        chart: {
        //            type: 'column'
        //        },
        //        title: {
        //            text: 'Stacked column chart'
        //        },
        //        xAxis: {
        //            categories: ['Apples', 'Oranges', 'Pears', 'Grapes', 'Bananas']
        //        },
        //        yAxis: {
        //            min: 0,
        //            title: {
        //                text: 'Total fruit consumption'
        //            },
        //            stackLabels: {
        //                enabled: true,
        //                style: {
        //                    fontWeight: 'bold',
        //                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
        //                }
        //            }
        //        },
        //        legend: {
        //            align: 'right',
        //            x: -30,
        //            verticalAlign: 'top',
        //            y: 25,
        //            floating: true,
        //            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
        //            borderColor: '#CCC',
        //            borderWidth: 1,
        //            shadow: false
        //        },
        //        tooltip: {
        //            headerFormat: '<b>{point.x}</b><br/>',
        //            pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
        //        },
        //        plotOptions: {
        //            column: {
        //                stacking: 'normal',
        //                dataLabels: {
        //                    enabled: true,
        //                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
        //                    style: {
        //                        textShadow: '0 0 3px black'
        //                    }
        //                }
        //            }
        //        },
        //        series: [{
        //            name: 'John',
        //            data: [5, 3, 4, 7, 2]
        //        }, {
        //            name: 'Jane',
        //            data: [2, 2, 3, 2, 1]
        //        }, {
        //            name: 'Joe',
        //            data: [3, 4, 4, 2, 5]
        //        }]
        //    });
        //});



        $(function () {
            $('#containerrrrr').highcharts({
                chart: {
                    type: 'bar'
                },
                title: {
                    text: 'Stacked column chart'
                },
                xAxis: {
                    categories: ['Apples', 'Oranges', 'Pears', 'Grapes', 'Bananas']
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Total fruit consumption'
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                },
                legend: {
                    align: 'right',
                    x: -30,
                    verticalAlign: 'top',
                    y: 25,
                    floating: true,
                    backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
                    borderColor: '#CCC',
                    borderWidth: 1,
                    shadow: false
                },
                tooltip: {
                    headerFormat: '<b>{point.x}</b><br/>',
                    pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
                },
                plotOptions: {
                    column: {
                        stacking: 'normal',
                        dataLabels: {
                            enabled: true,
                            color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                            style: {
                                textShadow: '0 0 3px black'
                            }
                        }
                    }
                },
                series: [{
                    name: 'John',
                    data: [5, 3, 4, 7, 2]
                }, {
                    name: 'Jane',
                    data: [2, 2, 3, 2, 1]
                }, {
                    name: 'Joe',
                    data: [3, 4, 4, 2, 5]
                }]
            });
        });



        //$(function () {
        //    // Create the chart
        //    $('#container3').highcharts({
        //        chart: {
        //            type: 'pie'
        //        },
        //        title: {
        //            text: 'Browser market shares. January, 2015 to May, 2015'
        //        },

        //        plotOptions: {
        //            series: {
        //                dataLabels: {
        //                    enabled: true,
        //                    format: '{point.name}: {point.y:.1f}%'
        //                }
        //            }
        //        },

        //        tooltip: {
        //            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        //            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
        //        },
        //        series: [{
        //            name: "Brands",
        //            colorByPoint: true,
        //            data: [{
        //                name: "Microsoft Internet Explorer",
        //                y: 56.33,
        //                drilldown: "Microsoft Internet Explorer"
        //            }, {
        //                name: "Chrome",
        //                y: 24.03,
        //                drilldown: "Chrome"
        //            }, {
        //                name: "Firefox",
        //                y: 10.38,
        //                drilldown: "Firefox"
        //            }, {
        //                name: "Safari",
        //                y: 4.77,
        //                drilldown: "Safari"
        //            }, {
        //                name: "Opera",
        //                y: 0.91,
        //                drilldown: "Opera"
        //            }, {
        //                name: "Proprietary or Undetectable",
        //                y: 0.2,
        //                drilldown: null
        //            }]
        //        }],
        //        drilldown: {
        //            series: [{
        //                name: "Microsoft Internet Explorer",
        //                id: "Microsoft Internet Explorer",
        //                data: [
        //                    ["v11.0", 24.13],
        //                    ["v8.0", 17.2],
        //                    ["v9.0", 8.11],
        //                    ["v10.0", 5.33],
        //                    ["v6.0", 1.06],
        //                    ["v7.0", 0.5]
        //                ]
        //            }, {
        //                name: "Chrome",
        //                id: "Chrome",
        //                data: [
        //                    ["v40.0", 5],
        //                    ["v41.0", 4.32],
        //                    ["v42.0", 3.68],
        //                    ["v39.0", 2.96],
        //                    ["v36.0", 2.53],
        //                    ["v43.0", 1.45],
        //                    ["v31.0", 1.24],
        //                    ["v35.0", 0.85],
        //                    ["v38.0", 0.6],
        //                    ["v32.0", 0.55],
        //                    ["v37.0", 0.38],
        //                    ["v33.0", 0.19],
        //                    ["v34.0", 0.14],
        //                    ["v30.0", 0.14]
        //                ]
        //            }, {
        //                name: "Firefox",
        //                id: "Firefox",
        //                data: [
        //                    ["v35", 2.76],
        //                    ["v36", 2.32],
        //                    ["v37", 2.31],
        //                    ["v34", 1.27],
        //                    ["v38", 1.02],
        //                    ["v31", 0.33],
        //                    ["v33", 0.22],
        //                    ["v32", 0.15]
        //                ]
        //            }, {
        //                name: "Safari",
        //                id: "Safari",
        //                data: [
        //                    ["v8.0", 2.56],
        //                    ["v7.1", 0.77],
        //                    ["v5.1", 0.42],
        //                    ["v5.0", 0.3],
        //                    ["v6.1", 0.29],
        //                    ["v7.0", 0.26],
        //                    ["v6.2", 0.17]
        //                ]
        //            }, {
        //                name: "Opera",
        //                id: "Opera",
        //                data: [
        //                    ["v12.x", 0.34],
        //                    ["v28", 0.24],
        //                    ["v27", 0.17],
        //                    ["v29", 0.16]
        //                ]
        //            }]
        //        }
        //    });
        //});
    </script>
    <style>
        html {
            background-color: #F6F4F4;
        }

        .table-header-rotated {
            border-collapse: collapse;
        }

        .csstransforms .table-header-rotated td {
            width: 30px;
        }

        .no-csstransforms .table-header-rotated th {
            padding: 5px 10px;
        }

        .table-header-rotated td {
            text-align: center;
            padding: 10px 5px;
            border: 1px solid #ccc;
        }

        .csstransforms .table-header-rotated th.rotate {
            height: 140px;
            white-space: nowrap;
        }

            .csstransforms .table-header-rotated th.rotate > div {
                -webkit-transform: translate(25px, 51px) rotate(315deg);
                -ms-transform: translate(25px, 51px) rotate(315deg);
                transform: translate(25px, 51px) rotate(315deg);
                width: 30px;
            }

                .csstransforms .table-header-rotated th.rotate > div > span {
                    border-bottom: 1px solid #ccc;
                    padding: 5px 10px;
                }

        .table-header-rotated th.row-header {
            padding: 0 10px;
            border-bottom: 1px solid #ccc;
            border-left: 1px solid #ccc;
        }
    </style>

    <style>
        /*Slider CSS*/
        #rainbow-slider {
            background: linear-gradient(to right, #00FF00 0,#FFFFFF 50%, #ff0000 100%) no-repeat;
            background-size: cover;
            border-radius: 30px;
            border: none;
            box-shadow: inset 0 0 0 1px rgba(0,0,0,.18);
            height: 10px;
        }

            #rainbow-slider.ui-slider-horizontal .ui-slider-range {
                background: transparent;
            }

            #rainbow-slider .ui-slider-handle {
                background: rgba(255, 255, 255, 0.21);
                border-color: rgba(0, 0, 0, 0.56);
                box-shadow: inset 0 0 2px 2px rgba(255, 255, 255, 0.89);
                border-radius: 20px;
                top: -8px;
            }

                #rainbow-slider .ui-slider-handle.ui-state-hover,
                #rainbow-slider .ui-slider-handle:hover,
                #rainbow-slider .ui-slider-handle.ui-state-focus,
                #rainbow-slider .ui-slider-handle:focus,
                #rainbow-slider .ui-slider-handle.ui-state-active {
                    background: rgba(255, 255, 255, 0.21);
                }

            #rainbow-slider .ui-slider-pip .ui-slider-label {
                width: 6em;
                margin-left: -3em;
            }

        #rainbow1-slider.ui-slider .ui-slider-range {
            background: linear-gradient(to right, #00FF00 0,#FFFFFF 50%, #ff0000 100%) no-repeat;
            border: 1px solid rgba(67, 77, 90, 0.5);
            top: -1px;
            transition: all 0.2s ease-out;
        }

        #rainbow-slider .ui-slider-pip .ui-slider-label {
            color: #000000;
        }


        #rainbow-slider .ui-slider-pip .ui-slider-line {
            top: 1px;
        }

        #rainbow-slider .ui-slider-pip:nth-of-type(odd) {
            top: auto;
            bottom: 32px;
        }

            #rainbow-slider .ui-slider-pip:nth-of-type(odd) .ui-slider-line {
                top: 21px;
            }

        #scale-slider.ui-slider {
            border-radius: 0px;
            background: #c7cdd5;
            border: none;
            height: 2px;
            margin: 1em 4em 4em;
        }

            #scale-slider.ui-slider .ui-slider-range {
                background: linear-gradient(to right, #434d5a 0%, #00c7d7 50%, #434d5a 100%) border: 1px solid rgba(67, 77, 90, 0.5);
                height: 4px;
                top: -1px;
                transition: all 0.2s ease-out;
            }

        #scale-slider .ui-slider-handle {
            border-radius: 2px;
            height: 20px;
            width: 12px;
            top: -26px;
            border: none;
        }

            #scale-slider .ui-slider-handle:nth-of-type(n+1) {
                transform: rotateZ(-10deg);
                margin-left: -9px;
            }

            #scale-slider .ui-slider-handle:nth-of-type(n+2) {
                transform: rotateZ(10deg);
                margin-left: -3px;
            }

            #scale-slider .ui-slider-handle:after {
                content: "";
                border: 6px solid transparent;
                width: 0;
                height: 0;
                position: absolute;
                bottom: -11px;
                border-top-color: #434d5a;
            }

            #scale-slider .ui-slider-handle.ui-slider-handle.ui-state-focus:after,
            #scale-slider .ui-slider-handle.ui-slider-handle.ui-state-hover:after,
            #scale-slider .ui-slider-handle.ui-slider-handle.ui-state-active:after {
                border-top-color: #00c7d7;
            }

        #scale-slider .ui-slider-pip {
            top: 2px;
        }

            #scale-slider .ui-slider-pip .ui-slider-label {
                display: none;
                background: rgba(67, 77, 90, 0);
                color: #434d5a;
                border-radius: 4px;
                padding: 0.3em 0;
                width: 2.4em;
                margin-left: -1.2em;
                transition: all 0.2s ease-out;
            }

            #scale-slider .ui-slider-pip .ui-slider-line {
                height: 4px;
            }

            #scale-slider .ui-slider-pip:nth-of-type(5n+3) .ui-slider-line {
                height: 8px;
            }

            #scale-slider .ui-slider-pip:nth-of-type(10n+3) .ui-slider-line {
                height: 12px;
            }

            #scale-slider .ui-slider-pip:nth-of-type(10n+3) .ui-slider-label {
                top: 16px;
                display: block;
            }

            #scale-slider .ui-slider-pip.ui-slider-pip-last .ui-slider-line {
                margin-left: -1px;
            }

            #scale-slider .ui-slider-pip.ui-slider-pip-selected .ui-slider-label,
            #scale-slider .ui-slider-pip.ui-slider-pip-selected-first .ui-slider-label,
            #scale-slider .ui-slider-pip.ui-slider-pip-selected-second .ui-slider-label {
                background: rgba(67, 77, 90, 0.7);
                color: #fffaf7;
            }


        /* End*/

        .ui-state-hover, .ui-state-focus {
            border: 0px;
        }
    </style>



    <style type="text/css">
        .active {
            border-style: solid;
            border-width: 2px;
            border-color: red;
        }
        body
        {
            font-family: Arial;
        }
        .topheader {
            background-color: #3bbfaf !important;
            font-weight: bold;
            color: white;
        }

        .leftpane {
            background-color: #FFFFFF !important;
        }

        .rightpane {
            background-color: #363636 !important;
        }

        .rcorners {
            border-radius: 25px;
            background: #8AC007;
            padding: 20px;
            width: 118px;
            height: 110px;
        }


        #upleft {
            width: 59%;
            height: 100%;
            float: left;
            /*border-style: solid;*/
            border-width: 1px;
            border-right: solid;
            border-right-color: gray;
        }

        #upright {
            width: 40%;
            height: 100%;
            /*border-style: solid;
            border-width: 1px;
            border-color: gray;*/
            float: left;
        }

        #below {
            height: 290px;
            width: 99%;
            /*border-style: solid;*/
            border-width: 1px;
            border-top: solid;
            border-top-color: gray;
            clear: both;
        }

    </style>
    <script>
        var timeoutVar = null;
        $(function () {

            $("#rainbow-slider ")
				.slider({
				    min: -3,
				    max: 3,
				    range: true,
				    step: 0.5,
				    values: [-3, 3],
				    slide: function (event, ui) {
				        console.log(ui.values);
				    },
				    change: function (event, ui) {
				        console.log("stop=" + ui.value);
				        clearTimeout(timeoutVar);
				        timeoutVar = setTimeout(function () {
				            recalculateWithSD(ui.values[0], ui.values[1]);
				        }, 100);
				    }
				}).slider("pips", {
				    rest: "label"
				});
            setTimeout(function () {
                recalculateWithSD(-3, 3);
            }, 200);
        });
        function outputUpdate(vol) {
            document.querySelector('#tolerenceOutput').value = vol;
            clearTimeout(timeoutVar);
            timeoutVar = setTimeout(function () {
                recalculateWithSD(vol);
            }, 100);
        }
        function rgb(p, color) {
            //console.log("p=>" + p);
            if (color == 'r') {
                r = 255;
                g = (1 - p) * 255;
            } else {
                g = 255;
                r = (1 - p) * 255;
            }

            b = (1 - p) * 255;
            return 'rgb(' + Math.round(r) + ',' + Math.round(g) + ',' + Math.round(b) + ')';
        }

        function recalculateWithSD(min, max) {
            var $rows = $("#tableOutput .attr");
            $rows.each(function () {
                var $row = $(this);
                var avg = parseFloat($row.find("td.avg").text());
                var sd = parseFloat($row.attr("data-sd")).toFixed(2);
                $row.children("td.val").each(function () {
                    var v = parseFloat($(this).text());
                    var zscore = (v - avg) / sd;
                    if (zscore > min && zscore < max) {
                        console.log("zscore=" + zscore);
                        if (zscore <= 0) {
                            $(this).css("background", rgb(((-1) * zscore / 3), "g"));
                        } else {
                            $(this).css("background", rgb((zscore / 3), "r"));
                        }
                    } else {
                        $(this).css("background-color", "#000");
                    }
                    if (min > 0) {
                        //$(this).css("background",rgb(zscore * threshold));
                    } else {
                        //$(this).css("background","white");
                    }
                });

            });
        }

        function recalculate(threshold) {
            var $rows = $("#tableOutput .attr");
            $rows.each(function () {
                var $row = $(this);
                var avg = parseInt($row.find("td.avg").text());
                $row.children("td.val").each(function () {
                    var v = parseInt($(this).text());
                    var per = 0;
                    if (v > avg) {
                        per = ((v - avg) * 100) / avg
                        console.log(per);
                    }
                    if (threshold > 0 && per >= threshold) {
                        $(this).css("background", "red")
                    } else {
                        $(this).css("background", "white")
                    }
                });

            });
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
         <div class="ui-layout-center leftpane">
        <div id="upleft">

            <div id="container" style="min-width: 310px; height: 600px; margin: 0 auto"></div>
        </div>

        <div id="upright" style="padding-left: 10px">

            <table id="t1" style="width: 90%; border:1px solid;">
                <thead>
                    <th><b>Supervisor Name</b></th>
                    <th><b>Top KPI</b></th>
                    <th><b>Worst KPI</b></th>
                </thead>
                <tr>
                    <td>Supervisor 1</td>
                    <td>FCR</td>
                    <td>FCR 2</td>
                </tr>
                <tr>
                    <td>Supervisor 1</td>
                    <td>FCR</td>
                    <td>FCR 2</td>
                </tr>
                <tr>
                    <td>Supervisor 1</td>
                    <td>FCR</td>
                    <td>FCR 2</td>
                </tr>
                <tr>
                    <td>Supervisor 1</td>
                    <td>FCR</td>
                    <td>FCR 2</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="ui-layout-north topheader">Prototype</div>
    
    <div class="ui-layout-east rightpane" style="background-color: #363636">
        <div style="background-color: #FF3333; color: white; margin-top:-25px; width:100%">
            <h2 style="vertical-align: middle">Leader Board</h2>
        </div>
        <p id="rcorners1" class="rcorners">Agent 1</p>
        <p id="rcorners1" class="rcorners">Agent 2</p>
        <p id="rcorners1" class="rcorners" style="background: yellow">Agent 3</p>
        <p id="rcorners1" class="rcorners">Agent 4</p>
        <p id="rcorners1" class="rcorners">Agent 5</p>
        <p id="rcorners1" class="rcorners">Agent 6</p>
        <p id="rcorners1" class="rcorners">Agent 7</p>
        <p id="rcorners1" class="rcorners">Agent 8</p>
        <p id="rcorners1" class="rcorners">Agent 9</p>
        <p id="rcorners1" class="rcorners">Agent 10</p>
    </div>

    </form>
</body>
</html>
