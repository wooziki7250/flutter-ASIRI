import 'package:flutter/material.dart';
import 'package:team4_ing_app/gdp_dp_chart/gdp_dp_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GdpDpChart extends StatefulWidget {
  final List<GdpDpSeries> data;
  const GdpDpChart({Key? key, required this.data}) : super(key: key);

  @override
  _GdpDpChartState createState() => _GdpDpChartState();
}

class _GdpDpChartState extends State<GdpDpChart> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<GdpDpSeries, num>> series = [
      charts.Series(
          id: "developers",
          data: widget.data,
          domainFn: (GdpDpSeries series, _) => series.year,
          measureFn: (GdpDpSeries series, _) => series.developers,
          colorFn: (GdpDpSeries series, _) => series.barColor)
    ];
    return SizedBox(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const Text(
                  'GDP 디플레이터 성장률',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '(2016년~2020년)',
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
                      viewport: charts.NumericExtents(2016.0, 2020.0),
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
