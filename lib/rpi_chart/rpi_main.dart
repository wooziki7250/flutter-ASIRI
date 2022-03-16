import 'dart:convert';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:team4_ing_app/rpi_chart/rpi_chart.dart';
import 'package:team4_ing_app/rpi_chart/rpi_series.dart';
import 'package:http/http.dart' as http;

class RPIMain extends StatefulWidget {
  const RPIMain({Key? key}) : super(key: key);

  @override
  _RPIMainState createState() => _RPIMainState();
}

class _RPIMainState extends State<RPIMain> {
  late List<RPISeries> data;

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
        title: const Text('물가지수 차트'),
      ),
      body: Center(
        child: RPIChart(data: data),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = Uri.parse('http://localhost:8080/Flutter/RPI_flutter.jsp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    setState(() {
      for (int i = 0; i < result.length; i++) {
        data.add(RPISeries(
          yearmonth: int.parse(result[i]['yearmonth']),
          rpi: double.parse(result[i]['rpi']),
          barColor: ColorUtil.fromDartColor(Colors.red),
        ));
      }
    });
    return response.body;
  }
} // End
