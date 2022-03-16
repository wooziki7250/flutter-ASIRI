import 'package:flutter/material.dart';
import 'package:team4_ing_app/gibang_in_chart/gibang_in_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GibangInChart extends StatefulWidget {
  final List<GibangInSeries> data;
  const GibangInChart({Key? key, required this.data}) : super(key: key);

  @override
  _GibangInChartState createState() => _GibangInChartState();
}

class _GibangInChartState extends State<GibangInChart> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<GibangInSeries, num>> series = [
      charts.Series(
        id: "gibang_move_in",
        data: widget.data,
        // x축
        domainFn: (GibangInSeries series, _) => series.year,
        // y축
        measureFn: (GibangInSeries series, _) => series.pop,
        // individual color
        colorFn: (GibangInSeries series, _) => series.barColor,
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
                  '비수도권 총전입수',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '(2012년 ~ 2020년)',
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
                      // viewport: charts.NumericExtents(2012.0, 2021.0),
                    ),
                    primaryMeasureAxis: const charts.NumericAxisSpec(
                      tickProviderSpec:
                          charts.BasicNumericTickProviderSpec(zeroBound: false),
                      viewport: charts.NumericExtents(-400000, 700000),
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
