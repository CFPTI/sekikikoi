
$(document).ready(function () {
    // let dataClone;
    //var refChart = null;
    var myGETParam;
    function manageChartCLick(refChart, dataArray) {
        window.location = "./detailMain.html?cat=" + dataArray[refChart.getSelection()[0].row].id_category + "&idTitle=1";
    }

    google.charts.load('current', {'packages': ['corechart']});
    google.charts.setOnLoadCallback(function () {
        loadChartCallback();
    });
    function callDetail()
    {
        $.ajax({
            url: "backend/backend.php",
            type: "GET",
            data: {
                "methodName": "getReferencesForTitle",
                "idMedia": myGETParam.idTitle,
                "idCategory": myGETParam.cat
            },
            success: function (result) {
                console.log(myGETParam.cat);
                switch (parseInt(myGETParam.cat)) {
                    case 5:
                        document.body.style.backgroundImage ="url(img/backPoli.jpg)";
                        break;
                    case 2:
                        document.body.style.backgroundImage ="url(img/backCine.jpg)";
                        break;
                    case 1:
                        document.body.style.backgroundImage ="url(img/backMusic.jpg)";
                        break;
                }
                drawModel(result[0].name);
                drawAllDetail(result);
            }});
    }
    function loadChartCallback() {
        let getChartData = new Promise(function (resolve, reject) {
            $.ajax({
                url: "backend/backend.php",
                type: "GET",
                data: {
                    "methodName": "getAllRefsByTitleId",
                },
                success: function (result) {
                    resolve(result);
                }});
        });
        getChartData.then(function (data) {
            drawChart(data);
        });
    }

    function drawChart(dataArray) {

        var chartData = [];
        for (var k of dataArray) {
            chartData.push([k.name, parseInt(k.numberOfRef)]);
        }
        var refChartOptions = {
            legend: "none",
            title: '',
            pieSliceText: 'label',
            fontSize: 20,
            animation: {
                duration: 1000,
                easing: "out",
                startup: true
            },
            chartArea:{width:'90%',height:'100%'},
            backgroundColor: {fill: 'transparent'}
        };

        var refChartId = "refChart";

        var refChartData = new google.visualization.DataTable();
        refChartData.addColumn('string', 'Catégorie');
        refChartData.addColumn('number', 'Nb de références');

        refChartData.addRows(chartData);

        //initDrawChart = new Promise(function(resolve, reject){
        var refChart = new google.visualization.PieChart(document.getElementById(refChartId));
        refChart.draw(refChartData, refChartOptions);
        google.visualization.events.addListener(refChart, 'select', function () {
            manageChartCLick(refChart, dataArray);
        });

    }
    String.prototype.format = function () {
        a = this;
        for (k in arguments) {
            a = a.replace("{" + k + "}", arguments[k])
        }
        return a
    }

    function drawAllDetail(json)
    {
        for (var i = 0; i < json.length; i++) {
            drawDetail(json[i], i);
        }
    }

    function drawDetail(json, id)
    {
        var nom = json.titre;
        var text = json.description;
        var icon = json.icon_type;
        var label = json.label;
        var src = json.url;
        var htmlDiv = ['<div class="card item-card">',
            '<div class="card-header" id="heading{0}">'.format(id),
            ' <div class="btn-group btn-group-toggle btn-block" data-toggle="buttons">',
            '<label class="btn btn-dark labelOriented">{0}</label>'.format(label),
            '<label class="btn btn-secondary btn-block">',
            '<button class="btn btn-link collapsed text-decoration-none text-white btn-block" data-toggle="collapse" data-target="#collapse{0}" aria-expanded="true" aria-controls="collapse{1}">'.format(id, id),
            '{0} {1}</button>'.format(icon, nom),
            '</label>',
            '</div>',
            '<div id="collapse{0}" class="collapse" aria-labelledby="heading{1}" data-parent="#accordion">'.format(id, id),
            '<div class="card-body">',
            '<p>{0}</p>'.format(text),
            '<a href="{0}" class="btn btn-primary">Voir la source</a>'.format(src),
            '</div>',
            '</div>',
            '</div>',
            '</div>'].join("\n");
        $("#accordion").append(htmlDiv);
    }

    function drawModel(title)
    {
        var html = [
            ' <h1 class="text-center text-white">Référence {0}</h1>'.format(title),
            '<div class="row">',
            '<div class="col-12">',
            ' <div class="card card-image" style="background-color: rgba(255, 0, 0, 0.1);">',
            '<div class="py-5 px-4">',
            '<div class="row d-flex justify-content-center">',
            '<div class="col-md-10 col-xl-8">',
            '<div id="accordion">',
            '</div>',
            '</div>',
            '</div>',
            '</div>',
            '</div>',
            '</div>',
            '</div>',
            '<div class="row">',
            '<div class="col-12 no-padding">',
            ' <div id="refChart" style="width: 100vw; min-height: 400px;"></div>',
            ' </div>',
            '</div>'
        ].join("\n");
        $("#sekikikoiApp").append(html);
    }
    function getGetParamFromJs()
    {
        var array = window.location.search.substr(1).split("&");
        var result = [];
        for (var i = 0; i < array.length; i++) {
            var param = array[i].split("=");
            result[param[0]] = param[1];
        }
        return result;
    }

    myGETParam = getGetParamFromJs();
    callDetail();

});
