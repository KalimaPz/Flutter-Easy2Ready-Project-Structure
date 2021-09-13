import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartView extends StatefulWidget {
  static String routeName = "views/chart";
  ChartView({Key key}) : super(key: key);

  @override
  _ChartViewState createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart View'),
      ),
      body: LineChart(LineChartData(lineBarsData: [
        LineChartBarData(1)
      ])),
    );
  }
}
