import 'package:flutter/material.dart';
import 'package:team4_ing_app/jeju_out_chart/jeju_out_series.dart';
import 'package:charts_flutter/flutter.dart' as charts; // ***

class JejuOutChart extends StatefulWidget {
  final List<JejuOutSeries> data;
  const JejuOutChart({Key? key, required this.data}) : super(key: key);

  @override
  _JejuOutChartState createState() => _JejuOutChartState();
}

class _JejuOutChartState extends State<JejuOutChart> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<JejuOutSeries, num>> series = [
      charts.Series(
        id: "jeju_move_out",
        data: widget.data,
        // x축
        domainFn: (JejuOutSeries series, _) => series.year,
        // y축
        measureFn: (JejuOutSeries series, _) => series.pop,
        // individual color
        colorFn: (JejuOutSeries series, _) => series.barColor,
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
                  '제주 총전출 ',
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
                      viewport: charts.NumericExtents(60000, 100000),
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
