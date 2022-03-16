import 'package:flutter/material.dart';
import 'package:team4_ing_app/gdp_dp_chart/gdp_dp_chart.dart';
import 'package:team4_ing_app/gdp_dp_chart/gdp_dp_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GdpDpMain extends StatefulWidget {
  const GdpDpMain({Key? key}) : super(key: key);

  @override
  _GdpDpMainState createState() => _GdpDpMainState();
}

class _GdpDpMainState extends State<GdpDpMain> {
  final List<GdpDpSeries> data = [];

  @override
  void initState() {
    super.initState();
    data.add(GdpDpSeries(
      year: 2016,
      developers: 2.0,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ));
    data.add(GdpDpSeries(
      year: 2017,
      developers: 2.2,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ));
    data.add(GdpDpSeries(
      year: 2018,
      developers: 0.5,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ));
    data.add(GdpDpSeries(
      year: 2019,
      developers: -0.8,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ));
    data.add(GdpDpSeries(
      year: 2020,
      developers: 1.3,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('경제성장률'),
      ),
      body: Center(
        child: GdpDpChart(data: data),
      ),
    );
  }
}
