import 'package:flutter/material.dart';
import 'package:team4_ing_app/cd_rate_chart/cd_rate_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CdRateChart extends StatefulWidget {
  final List<CdRateSeries> data;
  const CdRateChart({Key? key, required this.data}) : super(key: key);

  @override
  _CdRateChartState createState() => _CdRateChartState();
}

class _CdRateChartState extends State<CdRateChart> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<CdRateSeries, num>> series = [
      charts.Series(
        id: "cd",
        data: widget.data,
        // x축
        domainFn: (CdRateSeries series, _) => series.year,
        // y축
        measureFn: (CdRateSeries series, _) => series.rate,
        // individual color
        colorFn: (CdRateSeries series, _) => series.barColor,
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
                  'CD유통수익률(91일)',
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
