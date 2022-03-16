import 'package:flutter/material.dart';
import 'package:team4_ing_app/gdp_chart/gdp_m_main.dart';
import 'package:team4_ing_app/gdp_chart/gdp_s_chart.dart';
import 'package:team4_ing_app/gdp_chart/gdp_s_main.dart';
import 'package:team4_ing_app/gdp_dp_chart/gdp_dp_main.dart';

class GdpPage extends StatefulWidget {
  const GdpPage({Key? key}) : super(key: key);

  @override
  _GdpPageState createState() => _GdpPageState();
}

class _GdpPageState extends State<GdpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GDP'),
        backgroundColor: Colors.orangeAccent,
        elevation: 0, // appbar 밑에 그림자 제거
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/populationIcon.png'),
              ),
              accountName: Text('천사조'),
              accountEmail: Text('team4@gmail.com'),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text('Home'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(500, 100),
                  primary: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    // 모서리 모양
                    borderRadius: BorderRadius.circular(20.0), // 모서리 모양 둥글게
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const GdpMMain();
                  }));
                },
                child: const Text(
                  '명목 GDP',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(500, 100),
                  primary: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    // 모서리 모양
                    borderRadius: BorderRadius.circular(20.0), // 모서리 모양 둥글게
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const GdpSMain();
                  }));
                },
                child: const Text(
                  '실질 GDP',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(500, 100),
                  primary: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    // 모서리 모양
                    borderRadius: BorderRadius.circular(20.0), // 모서리 모양 둥글게
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const GdpDpMain();
                  }));
                },
                child: const Text(
                  'GDP 디플레이터',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
