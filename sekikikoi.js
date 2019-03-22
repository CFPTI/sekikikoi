$( document ).ready(function() {
   // let dataClone;
    //var refChart = null;

    function manageChartCLick(refChart, dataArray){
        window.location = "./detailMain.html?cat=" + dataArray[refChart.getSelection()[0].row].id_category + "&idMedia=1";
    }

    google.charts.load('current', {'packages': ['corechart']});
    google.charts.setOnLoadCallback(function(){
        loadChartCallback();
    });

    function loadChartCallback(){
        let getChartData = new Promise(function(resolve, reject){
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
    
        getChartData.then(function(data){
            drawChart(data);
        });
    }

    function drawChart(dataArray) {
        dataClone = dataArray;
        var chartData = [];
        for (var k of dataArray){
            chartData.push([k.name, parseInt(k.numberOfRef)]);
        }

        var refChartOptions = {
            legend: "none",
            title: '',
            pieSliceText: 'label',
            animation: {
                duration: 1000,
                easing: "out",
                startup: true
            },
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
        google.visualization.events.addListener(refChart, 'select', function() {
            manageChartCLick(refChart, dataArray);
        });

    }

    

    // function drawChartDb(json)
    // {
    //     var array = [];
    //     for (var k of json)
    //         array.push([k.name, parseInt(k.number)]);
    //     var myChart = drawChart(array);

    //     google.visualization.events.addListener(myChart, 'select', function () {
    //         window.location = "./detailPolitique.html?cat=" + dataArray[myChart.getSelection()[0].row][0];
    //     });

    // }

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
            drawAllDetail(json[i], i);
        }
    }

    function drawDetail(json, id)
    {
        var nom = json.name;
        var text = json.text;
        
        var htmlDiv = ['<div class="card item-card">',
            '<div class="card-header" id="heading{0}">'.format(id),
            ' <div class="btn-group btn-group-toggle btn-block" data-toggle="buttons">',
            '<label class="btn btn-secondary labelOriented">Sample</label>',
            '<label class="btn btn-secondary btn-block">',
            '<button class="btn btn-link collapsed text-decoration-none text-white btn-block" data-toggle="collapse" data-target="#collapse{0}" aria-expanded="true" aria-controls="collapse{1}">'.format(id, id),
            '<i class="fas fa-quote-right"></i>{0}</button>'.format(nom),
            '</label>',
            '</div>',
            '<div id="collapse{0}" class="collapse" aria-labelledby="heading{1}" data-parent="#accordion">'.format(id, id),
            '<div class="card-body">',
            '<p>{0}</p>'.format(text),
            '<a href="#" class="btn btn-primary">Voir le film</a>',
            '</div>',
            '</div>',
            '</div>',
            '</div>'].join("\n");
        $("#accordion").append(htmlDiv);
    }

    function drawModel()
    {
        var title = "Référence Cinéma";
        var html = [
            '<h1 class="text-center">{0}</h1>'.format(title),
            '<div class="card card-image" style="background-color: rgba(255, 0, 0, 0.1);">',
            '<div class="py-5 px-4">',
            '<div class="row d-flex justify-content-center">',
            '<div class="col-md-10 col-xl-8">',
            '<div id="accordion">',
            '</div>',
            '</div>',
            '</div>',
            '</div>',
            '<div id="refChart" style="width: 100vw; height: 45vh;"></div>',
            '</div>'
        ].join("\n");
        $("#sekikikoiApp").append(html);
    }
});
