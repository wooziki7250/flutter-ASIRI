import 'package:flutter/material.dart';
import 'package:team4_ing_app/gukgo_chart/gukgo_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GukgoChart extends StatefulWidget {
  final List<GukgoSeries> data;
  const GukgoChart({Key? key, required this.data}) : super(key: key);

  @override
  _GukgoChartState createState() => _GukgoChartState();
}

class _GukgoChartState extends State<GukgoChart> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<GukgoSeries, num>> series = [
      charts.Series(
        id: 'gukgo',
        data: widget.data,
        // x축
        domainFn: (GukgoSeries series, _) => series.year,
        // y
        measureFn: (GukgoSeries series, _) => series.rate,
        // individual color
        colorFn: (GukgoSeries series, _) => series.barColor,
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
                  '국고채- 3년물',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '(2012년~2020년, 이자율)',
                  style: TextStyle(fontWeight: FontWeight.normal),
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
