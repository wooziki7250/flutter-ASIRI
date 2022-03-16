import 'dart:convert';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:team4_ing_app/gukgo_chart/gukgo_chart.dart';
import 'package:team4_ing_app/gukgo_chart/gukgo_series.dart';
import 'package:http/http.dart' as http;

class GukgoMain extends StatefulWidget {
  const GukgoMain({Key? key}) : super(key: key);

  @override
  _GukgoMainState createState() => _GukgoMainState();
}

class _GukgoMainState extends State<GukgoMain> {
  late List<GukgoSeries> data;

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
        title: const Text('국고채(3년)'),
      ),
      body: Center(
        child: GukgoChart(data: data),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/gukgo_for_sqldb_flutter.jsp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    setState(() {
      for (int i = 0; i < result.length; i++) {
        data.add(GukgoSeries(
          year: int.parse(result[i]['year']),
          rate: double.parse(result[i]['rate']),
          barColor: ColorUtil.fromDartColor(Colors.red),
        ));
      }
    });
    return response.body;
  }
}
