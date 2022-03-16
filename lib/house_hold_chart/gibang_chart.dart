import 'package:flutter/material.dart';
import 'package:team4_ing_app/house_hold_chart/gibang_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GibangChart extends StatefulWidget {
  final List<GibangSeries> data;
  const GibangChart({Key? key, required this.data}) : super(key: key);

  @override
  _GibangChartState createState() => _GibangChartState();
}

class _GibangChartState extends State<GibangChart> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<GibangSeries, String>> series = [
      charts.Series(
          id: "developers",
          data: widget.data,
          // x-axis
          domainFn: (GibangSeries series, _) => series.year.toString(),
          // y-axis
          measureFn: (GibangSeries series, _) => series.developers,
          // individual color
          colorFn: (GibangSeries series, _) => series.barColor)
    ];
    // return charts.BarChart(series, animate: true); // Version 1
    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Column(
              children: [
                const Text(
                  '비수도권 가구부채(만원)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '(2017년 ~ 2020년)',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Expanded(
                  child: charts.BarChart(
                    series,
                    animationDuration: const Duration(seconds: 2),
                    animate: true,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
