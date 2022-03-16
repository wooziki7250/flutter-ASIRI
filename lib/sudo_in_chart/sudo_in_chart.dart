import 'package:flutter/material.dart';
import 'package:team4_ing_app/sudo_in_chart/sudo_in_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SudoInChart extends StatefulWidget {
  final List<SudoInSeries> data;
  const SudoInChart({Key? key, required this.data}) : super(key: key);

  @override
  _SudoInChartState createState() => _SudoInChartState();
}

class _SudoInChartState extends State<SudoInChart> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<SudoInSeries, num>> series = [
      charts.Series(
        id: "sudo_move_in",
        data: widget.data,
        // x축
        domainFn: (SudoInSeries series, _) => series.year,
        // y축
        measureFn: (SudoInSeries series, _) => series.pop,
        // individual color
        colorFn: (SudoInSeries series, _) => series.barColor,
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
                  '경기•인천 총전입 ',
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
                      // viewport: charts.NumericExtents(2012.0, 2021.0),
                    ),
                    primaryMeasureAxis: const charts.NumericAxisSpec(
                      tickProviderSpec:
                          charts.BasicNumericTickProviderSpec(zeroBound: false),
                      viewport: charts.NumericExtents(2000000, 2700000),
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
