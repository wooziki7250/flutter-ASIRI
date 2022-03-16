import 'dart:convert';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:team4_ing_app/gdp_chart/gdp_m_chart.dart';
import 'package:team4_ing_app/gdp_chart/gdp_m_series.dart';
import 'package:http/http.dart' as http;

class GdpMMain extends StatefulWidget {
  const GdpMMain({Key? key}) : super(key: key);

  @override
  _GdpMMainState createState() => _GdpMMainState();
}

class _GdpMMainState extends State<GdpMMain> {
  late List<GdpMSeries> data;

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GDP 차트'),
      ),
      body: Center(
        child: GdpMChart(data: data),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = Uri.parse('http://localhost:8080/Flutter/gdp_flutter.jsp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];

    setState(() {
      for (int i = 0; i < result.length; i++) {
        data.add(GdpMSeries(
          year: int.parse(result[i]['year']),
          gdp: int.parse(result[i]['gdp']),
          barcolor: ColorUtil.fromDartColor(Colors.red),
        ));
      }
    });
    return response.body;
  }
} // End