import 'package:charts_flutter/flutter.dart' as charts;

class CdRateSeries {
  late int year;
  late double rate;
  late charts.Color barColor;

  CdRateSeries({
    required this.year,
    required this.rate,
    required this.barColor,
  });
}
