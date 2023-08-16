import 'package:chart_component/bar_chart.dart';
import 'package:chart_component/pie_chart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: CustomPieChart(
                  hasMotion: true,
                  largeSectionThickness: 180,
                  defaultSectionThickness: 150,
                  titleByPercent: true,
                  section: [
                    PieChartSectionModel(
                        title: 'title', color: Colors.red, value: 10),
                    PieChartSectionModel(
                        title: 'title2', color: Colors.green, value: 7),
                    PieChartSectionModel(
                        title: 'title2', color: Colors.blue, value: 9),
                    PieChartSectionModel(
                        title: 'title2', color: Colors.purple, value: 3),
                    PieChartSectionModel(
                        title: 'title3', color: Colors.cyanAccent, value: 4),
                    PieChartSectionModel(
                        title: 'title3', color: Colors.amber, value: 0.5),
                  ],
                ),
              ),
              Expanded(
                child: CustomBarChart(
                  bars: [
                    BarChartModel(
                        value: 1500, title: 'Sat', color: Colors.black),
                    BarChartModel(
                        value: 2515, title: 'Sun', color: Colors.blue),
                    BarChartModel(
                        value: 2021, title: 'Mon', color: Colors.cyanAccent),
                    BarChartModel(
                        value: 1659, title: 'Tue', color: Colors.pink),
                    BarChartModel(
                        value: 1892, title: 'Wed', color: Colors.green),
                    BarChartModel(
                        value: 2134, title: 'Thu', color: Colors.yellow),
                    BarChartModel(value: 2354, title: 'Fri', color: Colors.red),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
