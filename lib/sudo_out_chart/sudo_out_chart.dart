import 'package:flutter/material.dart';
import 'package:team4_ing_app/sudo_out_chart/sudo_out_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SudoOutChart extends StatefulWidget {
  final List<SudoOutSeries> data;
  const SudoOutChart({Key? key, required this.data}) : super(key: key);

  @override
  _SudoOutChartState createState() => _SudoOutChartState();
}

class _SudoOutChartState extends State<SudoOutChart> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<SudoOutSeries, num>> series = [
      charts.Series(
        id: "sudo_move_out",
        data: widget.data,
        // x축
        domainFn: (SudoOutSeries series, _) => series.year,
        // y축
        measureFn: (SudoOutSeries series, _) => series.pop,
        // individual color
        colorFn: (SudoOutSeries series, _) => series.barColor,
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
                  '경기•인천 총전출 ',
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
                    animationDuration: const Duration(seconds: 1),
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
