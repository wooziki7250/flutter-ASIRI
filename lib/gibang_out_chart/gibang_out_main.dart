import 'dart:convert';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:team4_ing_app/gibang_out_chart/gibang_out_chart.dart';
import 'package:team4_ing_app/gibang_out_chart/gibang_out_series.dart';
import 'package:http/http.dart' as http;

class GibangOutMain extends StatefulWidget {
  const GibangOutMain({Key? key}) : super(key: key);

  @override
  _GibangOutMainState createState() => _GibangOutMainState();
}

class _GibangOutMainState extends State<GibangOutMain> {
  late List<GibangOutSeries> data;

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
        title: const Text('비수도권 총전출 차트'),
      ),
      body: Center(
        child: GibangOutChart(data: data),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/gibang_move_out_flutter.jsp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    setState(() {
      for (int i = 0; i < result.length; i++) {
        data.add(GibangOutSeries(
          year: int.parse(result[i]['year']),
          pop: int.parse(result[i]['pop']),
          barColor: ColorUtil.fromDartColor(Colors.orange),
        ));
      }
    });
    return response.body;
  }
} // End

