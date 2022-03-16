import 'package:flutter/material.dart';
import 'package:team4_ing_app/gdp_chart/gdp_s_series.dart';
import 'package:charts_flutter/flutter.dart' as charts; // ************

class GdpSChart extends StatefulWidget {
  final List<GdpSSeries> data;
  const GdpSChart({Key? key, required this.data}) : super(key: key);

  @override
  _GdpSChartState createState() => _GdpSChartState();
}

class _GdpSChartState extends State<GdpSChart> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<GdpSSeries, num>> series = [
      charts.Series(
          id: "developers",
          data: widget.data,
          domainFn: (GdpSSeries series, _) => series.year,
          measureFn: (GdpSSeries series, _) => series.developers,
          colorFn: (GdpSSeries series, _) => series.barColor)
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
                  'GDP 성장률 - 실질',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '(2016년 ~ 2020년)',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Expanded(
                  child: charts.LineChart(
                    series,
                    animationDuration: const Duration(seconds: 3),
                    domainAxis: const charts.NumericAxisSpec(
                      tickProviderSpec:
                          charts.BasicNumericTickProviderSpec(zeroBound: false),
                      viewport: charts.NumericExtents(2016.0, 2020.0),
                    ),
                    primaryMeasureAxis: const charts.NumericAxisSpec(
                      tickProviderSpec:
                          charts.BasicNumericTickProviderSpec(zeroBound: false),
                      viewport: charts.NumericExtents(-2, 5),
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
