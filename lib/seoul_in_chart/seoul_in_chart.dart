import 'package:flutter/material.dart';
import 'package:team4_ing_app/seoul_in_chart/seoul_in_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SeoulInChart extends StatefulWidget {
  final List<SeoulInSeries> data;
  const SeoulInChart({Key? key, required this.data}) : super(key: key);

  @override
  _SeoulInChartState createState() => _SeoulInChartState();
}

class _SeoulInChartState extends State<SeoulInChart> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<SeoulInSeries, num>> series = [
      charts.Series(
        id: "seoul_move_in",
        data: widget.data,
        // x축
        domainFn: (SeoulInSeries series, _) => series.year,
        // y축
        measureFn: (SeoulInSeries series, _) => series.pop,
        // individual color
        colorFn: (SeoulInSeries series, _) => series.barColor,
      )
    ];
    return SizedBox(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Column(
              children: [
                const Text(
                  '서울 총전입',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '(2012 ~ 2020)',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Expanded(
                  child: charts.LineChart(
                    series,
                    animationDuration: const Duration(seconds: 2),
                    domainAxis: const charts.NumericAxisSpec(
                      tickProviderSpec:
                          charts.BasicNumericTickProviderSpec(zeroBound: false),
                      //viewport: charts.NumericExtents(2012.0, 2021.0),
                    ),
                    primaryMeasureAxis: const charts.NumericAxisSpec(
                      tickProviderSpec:
                          charts.BasicNumericTickProviderSpec(zeroBound: false),
                      viewport: charts.NumericExtents(1300000, 1800000),
                    ),
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
