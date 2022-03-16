import 'package:flutter/material.dart';
import 'package:team4_ing_app/seoul_out_chart/seoul_out_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SeoulOutChart extends StatefulWidget {
  final List<SeoulOutSeries> data;
  const SeoulOutChart({Key? key, required this.data}) : super(key: key);

  @override
  _SeoulOutChartState createState() => _SeoulOutChartState();
}

class _SeoulOutChartState extends State<SeoulOutChart> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<SeoulOutSeries, num>> series = [
      charts.Series(
        id: "jeju_move_out",
        data: widget.data,
        // x축
        domainFn: (SeoulOutSeries series, _) => series.year,
        // y축
        measureFn: (SeoulOutSeries series, _) => series.pop,
        // individual color
        colorFn: (SeoulOutSeries series, _) => series.barColor,
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
                  '서울 총전출 ',
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
