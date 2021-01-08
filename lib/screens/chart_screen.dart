import 'package:conews_flutter/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartPage extends StatefulWidget {
  final Widget child;
  final mortesConfirmadas;
  final casosConfirmados;
  final recuperadosConfirmados;

  const ChartPage(
      {this.child,
      this.casosConfirmados,
      this.mortesConfirmadas,
      this.recuperadosConfirmados});

  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  /* @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.end,
          backgroundColor: Colors.amber,
        ),
      ),
    );
  }
}*/
  List<charts.Series<Covid, String>> _seriesData;
  List<charts.Series<Task, String>> seriesPieData;

  generateData() {
    var pieData = [
      Task(AppLocalizations.of(context).translate('cases'),
          widget.casosConfirmados, Colors.blue),
      Task(AppLocalizations.of(context).translate('chart_deaths'),
          widget.mortesConfirmadas, Colors.red),
      Task(AppLocalizations.of(context).translate('chart_recovered'),
          widget.recuperadosConfirmados, Colors.green),
    ];

    seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskValue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorValue),
        id: 'COVID-19',
        labelAccessorFn: (Task row, _) => '${row.taskValue}',
      ),
    );
  }

  _generateData() {
    var data1 = [
      Covid(AppLocalizations.of(context).translate('chart_confirmed'),
          widget.casosConfirmados, Colors.amber),
      Covid(AppLocalizations.of(context).translate('chart_recovered'),
          widget.recuperadosConfirmados, Colors.green),
      Covid(AppLocalizations.of(context).translate('chart_deaths'),
          widget.mortesConfirmadas, Colors.red),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (Covid covid, _) => covid.place,
        measureFn: (Covid covid, _) => covid.quantity,
        id: '2020',
        data: data1,
        labelAccessorFn: (Covid row, _) => '${row.quantity}',
        fillColorFn: (Covid covid, _) =>
            charts.ColorUtil.fromDartColor(covid.color),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _seriesData = List<charts.Series<Covid, String>>();
    seriesPieData = List<charts.Series<Task, String>>();
    _generateData();
    generateData();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Color(0xff1976d2),
              bottom: TabBar(
                indicatorColor: Color(0xff9962D0),
                tabs: [
                  Tab(
                    icon: Icon(FontAwesomeIcons.solidChartBar),
                  ),
                  Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                ],
              ),
              centerTitle: true,
              title:
                  Text(AppLocalizations.of(context).translate('title_chart')),
            ),
            body: TabBarView(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'COVID - 19',
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: charts.BarChart(
                              _seriesData,
                              animate: true,
                              barGroupingType: charts.BarGroupingType.grouped,
                              animationDuration: Duration(seconds: 2),
                              barRendererDecorator: charts.BarLabelDecorator(
                                insideLabelStyleSpec: new charts.TextStyleSpec(
                                    fontSize: 14, fontWeight: 'bold'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'COVID-19 TEMPO',
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: charts.PieChart(
                              seriesPieData,
                              animate: true,
                              animationDuration: Duration(seconds: 2),
                              behaviors: [
                                charts.DatumLegend(
                                  outsideJustification:
                                      charts.OutsideJustification.startDrawArea,
                                  horizontalFirst: false,
                                  desiredMaxRows: 3,
                                  cellPadding: new EdgeInsets.only(
                                      right: 4.0, bottom: 4.0),
                                  entryTextStyle: charts.TextStyleSpec(
                                      color: charts.MaterialPalette.black,
                                      fontSize: 16),
                                ),
                              ],
                              defaultRenderer: charts.ArcRendererConfig(
                                arcRendererDecorators: [
                                  charts.ArcLabelDecorator(
                                      labelPosition:
                                          charts.ArcLabelPosition.outside),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Covid {
  final String place;
  final int quantity;
  final Color color;

  Covid(this.place, this.quantity, this.color);
}

class Task {
  String task;
  int taskValue;
  Color colorValue;

  Task(this.task, this.taskValue, this.colorValue);
}
