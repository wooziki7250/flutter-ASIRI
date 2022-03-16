import 'package:flutter/material.dart';
import 'package:team4_ing_app/gdp_chart/gdp_m_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GdpMChart extends StatefulWidget {
  final List<GdpMSeries> data;
  const GdpMChart({Key? key, required this.data}) : super(key: key);

  @override
  _GdpMChartState createState() => _GdpMChartState();
}

class _GdpMChartState extends State<GdpMChart> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<GdpMSeries, num>> series = [
      charts.Series(
        id: "iris",
        data: widget.data,
        // x-axis
        domainFn: (GdpMSeries series, _) => series.year,
        // y-axis
        measureFn: (GdpMSeries series, _) => series.gdp,
        // individual color
        colorFn: (GdpMSeries series, _) => series.barcolor,
      )
    ];
    // return charts.BarChart(series, animate: true); // Version 1
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
                  '국가 GDP',
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
                    animationDuration: const Duration(seconds: 2),
                    domainAxis: const charts.NumericAxisSpec(
                      tickProviderSpec:
                          charts.BasicNumericTickProviderSpec(zeroBound: false),
                      // viewport: charts.NumericExtents(2016.0, 2022.0),
                    ),
                    primaryMeasureAxis: const charts.NumericAxisSpec(
                      tickProviderSpec:
                          charts.BasicNumericTickProviderSpec(zeroBound: false),
                      viewport: charts.NumericExtents(1250000, 2000000),
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
