import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:team4_ing_app/rpi_chart/rpi_series.dart';

class RPIChart extends StatefulWidget {
  final List<RPISeries> data;
  const RPIChart({Key? key, required this.data}) : super(key: key);

  @override
  _RPIChartState createState() => _RPIChartState();
}

class _RPIChartState extends State<RPIChart> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<RPISeries, num>> series = [
      charts.Series(
        id: "jeju_move_in",
        data: widget.data,
        // x축
        domainFn: (RPISeries series, _) => series.yearmonth,
        // y축
        measureFn: (RPISeries series, _) => series.rpi,
        // individual color
        colorFn: (RPISeries series, _) => series.barColor,
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
                  '물가지수 차트',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '(2010.01~2021.11)',
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
                      viewport: charts.NumericExtents(2010.0, 2022.00),
                    ),
                    primaryMeasureAxis: const charts.NumericAxisSpec(
                      tickProviderSpec:
                          charts.BasicNumericTickProviderSpec(zeroBound: false),
                      viewport: charts.NumericExtents(80, 115),
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
