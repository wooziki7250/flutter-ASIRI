import 'package:charts_flutter/flutter.dart' as charts;

class GdpDpSeries {
  late int year;
  late double developers;
  late charts.Color barColor;

  GdpDpSeries({
    required this.year,
    required this.developers,
    required this.barColor,
  });
}
