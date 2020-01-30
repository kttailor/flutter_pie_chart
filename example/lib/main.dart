import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

// Sets a platform override for desktop to avoid exceptions. See
// https://flutter.dev/desktop#target-platform-override for more info.
void enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() {
  enablePlatformOverrideForDesktop();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pie Chart Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool toggle = false;
  Map<String, double> dataMap = Map();
  List<Color> colorList = [
    Color(0xff131d52),
    Color(0xff003066),
    Color(0xff1e4574),
    Color(0xff34649a),
    Color(0xff6480a5),
    Color(0xff798a99),
  ];

  @override
  void initState() {
    super.initState();
    dataMap.putIfAbsent("H", () => 5);
    dataMap.putIfAbsent("E", () => 3);
    dataMap.putIfAbsent("P", () => 2);
    dataMap.putIfAbsent("PL", () => 1);
    dataMap.putIfAbsent("C", () => 4);
    dataMap.putIfAbsent("A", () => 1);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pie Chart"),
      ),
      body: Container(
        child: Center(
          child: toggle
              ? PieChart(
                  dataMap: dataMap,
                  animationDuration: Duration(milliseconds: 800),
                  chartLegendSpacing: 32.0,
                  chartRadius: MediaQuery.of(context).size.width / 2.7,
                  showChartValuesInPercentage: false,
                  showChartValues: false,
                  showChartValuesOutside: false,
                  chartValueBackgroundColor: Colors.grey[200],
                  colorList: colorList,
                  showLegends: true,
                  legendPosition: LegendPosition.right,
                  decimalPlaces: 0,
                  showChartValueLabel: false,
                  initialAngle: 0,
                  chartValueStyle: defaultChartValueStyle.copyWith(
                    color: Colors.transparent,
                  ),
                  chartType: ChartType.disc,
                )
              : Text("Press FAB to show chart"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: togglePieChart,
        child: Icon(Icons.insert_chart),
      ),
    );
  }

  void togglePieChart() {
    setState(() {
      toggle = !toggle;
    });
  }
}
