import 'package:charts_flutter/flutter.dart' as charts;

class GibangSeries {
  late int year;
  late int developers;
  late charts.Color barColor;

  GibangSeries({
    required this.year,
    required this.developers,
    required this.barColor,
  });
}
