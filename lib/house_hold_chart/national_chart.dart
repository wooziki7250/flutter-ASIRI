import 'package:flutter/material.dart';
import 'package:team4_ing_app/house_hold_chart/national_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class NationalChart extends StatefulWidget {
  final List<NationalSeries> data;
  const NationalChart({Key? key, required this.data}) : super(key: key);

  @override
  _NationalChartState createState() => _NationalChartState();
}

class _NationalChartState extends State<NationalChart> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<NationalSeries, String>> series = [
      charts.Series(
          id: "developers",
          data: widget.data,
          // x-axis
          domainFn: (NationalSeries series, _) => series.year.toString(),
          // y-axis
          measureFn: (NationalSeries series, _) => series.developers,
          // individual color
          colorFn: (NationalSeries series, _) => series.barColor)
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
                  '전국 가구부채(만원)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '(2017년 ~ 2020년))',
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
