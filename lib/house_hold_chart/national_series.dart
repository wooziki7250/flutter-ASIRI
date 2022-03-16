import 'package:charts_flutter/flutter.dart' as charts;

class NationalSeries {
  late int year;
  late int developers;
  late charts.Color barColor;

  NationalSeries({
    required this.year,
    required this.developers,
    required this.barColor,
  });
}
