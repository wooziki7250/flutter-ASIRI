import 'package:flutter/material.dart';
import 'package:team4_ing_app/house_hold_chart/gibang_chart.dart';
import 'package:team4_ing_app/house_hold_chart/gibang_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GibangMain extends StatefulWidget {
  const GibangMain({Key? key}) : super(key: key);

  @override
  _GibangMainState createState() => _GibangMainState();
}

class _GibangMainState extends State<GibangMain> {
  final List<GibangSeries> data = [];
  @override
  void initState() {
    super.initState();
    data.add(GibangSeries(
      year: 2017,
      developers: 7099,
      barColor: charts.ColorUtil.fromDartColor(Colors.orangeAccent),
    ));
    data.add(GibangSeries(
      year: 2018,
      developers: 7668,
      barColor: charts.ColorUtil.fromDartColor(Colors.orangeAccent),
    ));
    data.add(GibangSeries(
      year: 2019,
      developers: 7910,
      barColor: charts.ColorUtil.fromDartColor(Colors.orangeAccent),
    ));
    data.add(GibangSeries(
      year: 2020,
      developers: 8256,
      barColor: charts.ColorUtil.fromDartColor(Colors.orangeAccent),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar Chart'),
      ),
      body: Center(
        child: GibangChart(data: data),
      ),
    );
  }
}
