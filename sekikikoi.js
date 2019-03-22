var dataArray = [
    ['Musique', 11],
    ['Cinéma', 2],
    ['Politique', 2],
    ['Autre', 2]
];

window.onload = function() {
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(init);
};

$(window).resize(function(){
    drawChart(dataArray);
});

function init() {

    var myChart = drawChart(dataArray);

    google.visualization.events.addListener(myChart, 'select', function() {
        console.log(myChart.getSelection());

        window.location = "./detailPolitique.html?cat=" + dataArray[myChart.getSelection()[0].row][0];
    });
}

function drawChart(dataArray) {
    var isChartHidden = false;

    var refChartOptions = {
        legend: "none",
        title: '',
        pieSliceText: 'label',
        animation: {
            duration: 4000,
            easing: "out",
            startup: true
        },
        backgroundColor: { fill:'transparent' }
    };
    var refChart = null;
    var refChartId = "refChart";

    var refChartData = new google.visualization.DataTable();
    refChartData.addColumn('string', 'Catégorie');
    refChartData.addColumn('number', 'Nb de références');

    refChartData.addRows(dataArray);

    refChart = new google.visualization.PieChart(document.getElementById(refChartId));
    refChart.draw(refChartData, refChartOptions);
    return refChart;
}

