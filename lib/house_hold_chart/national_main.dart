import 'package:flutter/material.dart';
import 'package:team4_ing_app/house_hold_chart/national_chart.dart';
import 'package:team4_ing_app/house_hold_chart/national_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class NationalMain extends StatefulWidget {
  const NationalMain({Key? key}) : super(key: key);

  @override
  _NationalMainState createState() => _NationalMainState();
}

class _NationalMainState extends State<NationalMain> {
  final List<NationalSeries> data = [];
  @override
  void initState() {
    super.initState();
    data.add(NationalSeries(
      year: 2017,
      developers: 7099,
      barColor: charts.ColorUtil.fromDartColor(Colors.orangeAccent),
    ));
    data.add(NationalSeries(
      year: 2018,
      developers: 7668,
      barColor: charts.ColorUtil.fromDartColor(Colors.orangeAccent),
    ));
    data.add(NationalSeries(
      year: 2019,
      developers: 7910,
      barColor: charts.ColorUtil.fromDartColor(Colors.orangeAccent),
    ));
    data.add(NationalSeries(
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
        child: NationalChart(data: data),
      ),
    );
  }
}
