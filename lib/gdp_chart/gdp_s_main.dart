import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:team4_ing_app/gdp_chart/gdp_s_chart.dart';
import 'package:team4_ing_app/gdp_chart/gdp_s_series.dart'; // ***

class GdpSMain extends StatefulWidget {
  const GdpSMain({Key? key}) : super(key: key);

  @override
  _GdpSMainState createState() => _GdpSMainState();
}

class _GdpSMainState extends State<GdpSMain> {
  final List<GdpSSeries> data = [];

  @override
  void initState() {
    super.initState();
    data.add(GdpSSeries(
      year: 2016,
      developers: 2.9,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ));
    data.add(GdpSSeries(
      year: 2017,
      developers: 3.2,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ));
    data.add(GdpSSeries(
      year: 2018,
      developers: 2.9,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ));
    data.add(GdpSSeries(
      year: 2019,
      developers: 2.2,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ));
    data.add(GdpSSeries(
      year: 2020,
      developers: -0.9,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Line Chart'),
      ),
      body: Center(
        child: GdpSChart(data: data),
      ),
    );
  }
}
