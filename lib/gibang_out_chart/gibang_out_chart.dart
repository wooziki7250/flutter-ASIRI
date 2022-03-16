import 'package:flutter/material.dart';
import 'package:team4_ing_app/gibang_out_chart/gibang_out_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GibangOutChart extends StatefulWidget {
  final List<GibangOutSeries> data;
  const GibangOutChart({Key? key, required this.data}) : super(key: key);

  @override
  _GibangOutChartState createState() => _GibangOutChartState();
}

class _GibangOutChartState extends State<GibangOutChart> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<GibangOutSeries, num>> series = [
      charts.Series(
        id: "gibang_move_out",
        data: widget.data,
        // x축
        domainFn: (GibangOutSeries series, _) => series.year,
        // y축
        measureFn: (GibangOutSeries series, _) => series.pop,
        // individual color
        colorFn: (GibangOutSeries series, _) => series.barColor,
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
                  '비수도권 총전출수',
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
                    animationDuration: const Duration(seconds: 1),
                    domainAxis: const charts.NumericAxisSpec(
                      tickProviderSpec:
                          charts.BasicNumericTickProviderSpec(zeroBound: false),
                      // viewport: charts.NumericExtents(2012.0, 2021.0),
                    ),
                    primaryMeasureAxis: const charts.NumericAxisSpec(
                      tickProviderSpec:
                          charts.BasicNumericTickProviderSpec(zeroBound: false),
                      viewport: charts.NumericExtents(3000000, 3700000),
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
