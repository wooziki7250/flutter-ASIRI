import 'package:charts_flutter/flutter.dart' as charts;

class GukgoSeries {
  late int year;
  late double rate;
  late charts.Color barColor;

  GukgoSeries({
    required this.year,
    required this.rate,
    required this.barColor,
  });
}
