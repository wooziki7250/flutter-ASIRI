import 'dart:convert';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:team4_ing_app/seoul_out_chart/seoul_out_chart.dart';
import 'package:team4_ing_app/seoul_out_chart/seoul_out_series.dart';
import 'package:http/http.dart' as http;

class SeoulOutMain extends StatefulWidget {
  const SeoulOutMain({Key? key}) : super(key: key);

  @override
  _SeoulOutMainState createState() => _SeoulOutMainState();
}

class _SeoulOutMainState extends State<SeoulOutMain> {
  late List<SeoulOutSeries> data;

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
        title: const Text('서울 총전출 차트'),
      ),
      body: Center(
        child: SeoulOutChart(data: data),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/seoul_move_out_flutter.jsp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    setState(() {
      for (int i = 0; i < result.length; i++) {
        data.add(SeoulOutSeries(
          year: int.parse(result[i]['year']),
          pop: int.parse(result[i]['pop']),
          barColor: ColorUtil.fromDartColor(Colors.orange),
        ));
      }
    });
    return response.body;
  }
} // End

