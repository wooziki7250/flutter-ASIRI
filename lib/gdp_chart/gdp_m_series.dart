import 'package:charts_flutter/flutter.dart' as charts;

class GdpMSeries {
  late int year;
  late int gdp;
  late charts.Color barcolor;

  GdpMSeries({
    required this.year,
    required this.gdp,
    required this.barcolor,
  });
}
