import 'package:flutter/material.dart';
import 'package:team4_ing_app/house_hold_chart/sudo_chart.dart';
import 'package:team4_ing_app/house_hold_chart/sudo_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SudoMain extends StatefulWidget {
  const SudoMain({Key? key}) : super(key: key);

  @override
  _SudoMainState createState() => _SudoMainState();
}

class _SudoMainState extends State<SudoMain> {
  final List<SudoSeries> data = [];
  @override
  void initState() {
    super.initState();
    data.add(SudoSeries(
      year: 2017,
      developers: 7099,
      barColor: charts.ColorUtil.fromDartColor(Colors.orangeAccent),
    ));
    data.add(SudoSeries(
      year: 2018,
      developers: 7668,
      barColor: charts.ColorUtil.fromDartColor(Colors.orangeAccent),
    ));
    data.add(SudoSeries(
      year: 2019,
      developers: 7910,
      barColor: charts.ColorUtil.fromDartColor(Colors.orangeAccent),
    ));
    data.add(SudoSeries(
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
        child: SudoChart(data: data),
      ),
    );
  }
}
