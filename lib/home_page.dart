import 'package:chart_component/bar_chart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
        ),
        body: Center(
          child: CustomBarChart(
            bars: [
              BarChartModel(1500, 'Sat'),
              BarChartModel(2515, 'Sun'),
              BarChartModel(2021, 'Mon'),
              BarChartModel(1659, 'Tue'),
              BarChartModel(1892, 'Wed'),
              BarChartModel(2134, 'Thu'),
              BarChartModel(2354, 'Fri'),
            ],
          ),
        ),
      );
}
