var ChartsAmcharts = function() {

    var initChartSample1 = function() {
        var chart = AmCharts.makeChart("chart_1", {
            "type": "serial",
            "theme": "light",
            "pathToImages": App.getGlobalPluginsPath() + "amcharts/amcharts/images/",
            "autoMargins": false,
            "marginLeft": 30,
            "marginRight": 8,
            "marginTop": 10,
            "marginBottom": 26,

            "fontFamily": 'Open Sans',            
            "color":    '#888',
            
            "dataProvider": [{
                "month": "Jan",
                "terminated": 23.5
            }, {
                "month": "Fev",
                "terminated": 26.2
            }, {
                "month": "Mar",
                "terminated": 30.1
            }, {
                "month": "Apr",
                "terminated": 29.5
            }, {
                "month": "May",
                "terminated": 30.6
            }, {
                "month": "Jun",
                "terminated": 34.1
            },{
                "month": "Jul",
                "terminated": 34.1
            },{
                "month": "Aug",
                "terminated": 34.1
            },{
                "month": "Sep",
                "terminated": 34.1
            },{
                "month": "Oct",
                "terminated": 34.1
            }
			,{
                "month": "Nov",
                "terminated": 34.1
            }
			,{
                "month": "Dec",
                "terminated": 34.1
            }
			
			
			],
            "valueAxes": [{
                "axisAlpha": 0,
                "position": "left"
            }],
            "startDuration": 1,
            "graphs": [{
                "alphaField": "alpha",
                "balloonText": "<span style='font-size:13px;'>[[title]] in [[category]]:<b>[[value]]</b> [[additional]]</span>",
                "dashLengthField": "dashLengthColumn",
                "fillAlphas": 1,
                "title": "terminated",
                "type": "column",
                "valueField": "terminated"
            }, {
                "balloonText": "<span style='font-size:13px;'>[[title]] in [[category]]:<b>[[value]]</b> [[additional]]</span>",
                "bullet": "round",
                "dashLengthField": "dashLengthLine",
                "lineThickness": 3,
                "bulletSize": 7,
                "bulletBorderAlpha": 1,
                "bulletColor": "#FFFFFF",
                "useLineColorForBulletBorder": true,
                "bulletBorderThickness": 3,
                "fillAlphas": 0,
                "lineAlpha": 1,
				 "title": "Terminated",
                "valueField": "terminated"
            }],
            "categoryField": "month",
            "categoryAxis": {
                "gridPosition": "start",
                "axisAlpha": 0,
                "tickLength": 0
            }
        });

    }
    return {
        init: function() {
            initChartSample1();
        }
    };
}();

jQuery(document).ready(function() {    
   ChartsAmcharts.init(); 
});