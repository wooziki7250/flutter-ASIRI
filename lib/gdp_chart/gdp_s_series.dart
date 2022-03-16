import 'package:charts_flutter/flutter.dart' as charts;

class GdpSSeries {
  late int year;
  late double developers;
  late charts.Color barColor;

  GdpSSeries({
    required this.year,
    required this.developers,
    required this.barColor,
  });
}
