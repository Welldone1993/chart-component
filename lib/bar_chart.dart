import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBarChart<T> extends StatefulWidget {
  const CustomBarChart({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<CustomBarChart<T>> createState() => _CustomBarChartState<T>();
}

class _CustomBarChartState<T> extends State<CustomBarChart<T>> {
  @override
  Widget build(BuildContext context) => SizedBox(
        width: widget.width ?? 100,
        height: widget.height ?? 100,
        child: Center(
          child: BarChart(_barChartData()),
        ),
      );
}

BarChartData _barChartData() {
  return BarChartData(barGroups: [
    BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 15)]),
  ]);
}
