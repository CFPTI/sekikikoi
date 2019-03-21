window.onload = function() {
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(init);
};

function init(){
    var musicPlayer = Vue.component('music-player', {
        props: ['music-link'],
        template:  '<iframe :src="musicLink" width="100%" height="380" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>'
    });

    var musicChart = Vue.component('music-chart', {
        data() {
            return {
                isChartHidden:false,
                refChartData : google.visualization.arrayToDataTable([
                    ['Catégorie', 'Nb de références'],
                    ['Musique',     11],
                    ['Cinéma',      2],
                    ['Politique',  2],
                    ['Autre', 2]
                ]),
                refChartOptions : {
                    legend:"none",
                    title: '',
                    pieSliceText:'label',
                    animation: {
                        duration: 1000,
                        easing: 'in',
                        startup: true
                    }
                },
                refChart : null,
                refChartId:"refPieChart"
            }
        },
        template:  '<div :id="refChartId" style="width: 900px; height: 500px;"></div>',
        mounted() {
           
            /*google.visualization.events.addListener(this.refChart, 'select', function() {
                console.log("select cat " + that.refChart.getSelection());
                showPage('detailRef');
            });*/
            this.initChart();
        },
        methods:{
            showPage : function(page){

            },
            initChart(){
                var that = this;
                $.ajax ({
                    url:"./backend.php",
                    data: {"methodName":"getAllRefsByTitleId"},
                    success: (data) => {
                        console.log(data);
                        data = new google.visualization.DataTable(data);
                        that.refChartData = data;
                        that.refChart = new google.visualization.PieChart(document.getElementById(that.refChartId));
                        that.refChart.draw(that.refChartData, that.refChartOptions);
                    }
                });
            }
        }
    });

    var app = new Vue({
        el:'#sekikikoiApp',
        methods: {
            showChart:function() {
                musicChart.props.isChartHidden = false;
            }
        }
    });
}

/*
click
google.visualization.events.addListener(chart, 'select', function() {
    console.log("select cat " + chart.getSelection());
});*/