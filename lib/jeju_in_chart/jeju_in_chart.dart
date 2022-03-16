import 'package:flutter/material.dart';
import 'package:team4_ing_app/jeju_in_chart/jeju_in_series.dart';
import 'package:charts_flutter/flutter.dart' as charts; // ***

class JejuInChart extends StatefulWidget {
  final List<JejuInSeries> data;
  const JejuInChart({Key? key, required this.data}) : super(key: key);

  @override
  _JejuInChartState createState() => _JejuInChartState();
}

class _JejuInChartState extends State<JejuInChart> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<JejuInSeries, num>> series = [
      charts.Series(
        id: "jeju_move_in",
        data: widget.data,
        // x축
        domainFn: (JejuInSeries series, _) => series.year,
        // y축
        measureFn: (JejuInSeries series, _) => series.pop,
        // individual color
        colorFn: (JejuInSeries series, _) => series.barColor,
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
                  '제주 총전입 ',
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
                      viewport: charts.NumericExtents(-15000, 50000),
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
