import 'package:charts_flutter/flutter.dart' as charts;

class SudoSeries {
  late int year;
  late int developers;
  late charts.Color barColor;

  SudoSeries({
    required this.year,
    required this.developers,
    required this.barColor,
  });
}
