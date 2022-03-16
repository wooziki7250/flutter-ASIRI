import 'package:charts_flutter/flutter.dart' as charts;

class RPISeries {
  late int yearmonth;
  late double rpi;
  late charts.Color barColor;

  RPISeries({
    required this.yearmonth,
    required this.rpi,
    required this.barColor,
  });
}
