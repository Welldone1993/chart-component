import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomBarChart<T> extends StatelessWidget {
  const CustomBarChart({
    Key? key,
    required this.barValue,
    this.chartWidth,
    this.chartHeight,
    this.barColor,
    this.barWidth,
    this.barBorderRadius,
    this.gradient,
    this.titleAngel,
    this.showBottomTitles,
    this.showLeftTitles,
    this.showRightTitles,
    this.showTopTitles,
    this.bottomAxisWidget,
    this.model,
  }) : super(key: key);

  final List<double> barValue;
  final double? chartWidth;
  final double? chartHeight;
  final double? barBorderRadius;
  final double? barWidth;
  final Color? barColor;
  final Gradient? gradient;
  final double? titleAngel;
  final bool? showTopTitles;
  final bool? showRightTitles;
  final bool? showLeftTitles;
  final bool? showBottomTitles;
  final Widget? bottomAxisWidget;
  final List<T>? model;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: chartWidth ?? barValue.length * 50,
        height: chartHeight ?? barValue.length * 50,
        child: Center(
          child: BarChart(_barChartData()),
        ),
      );

  BarChartData _barChartData() {
    return BarChartData(
      barGroups: [
        ..._barsGenerator(barValue),
      ],
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: showRightTitles ?? false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: showTopTitles ?? false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 60,
            showTitles: showLeftTitles ?? true,
          ),
        ),
        bottomTitles: AxisTitles(
          axisNameWidget: bottomAxisWidget,
          sideTitles: SideTitles(
            reservedSize: 60,
            showTitles: showBottomTitles ?? true,
            getTitlesWidget: (value, meta) => SideTitleWidget(
              angle: titleAngel ?? 0.0,
              axisSide: meta.axisSide,
              child: Text(value.toString()),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _barsGenerator(List<double> value) => value
      .map(
        (element) => BarChartGroupData(
          x: value.indexOf(element),
          barRods: [
            BarChartRodData(
              gradient: gradient,
              width: barWidth,
              toY: element,
              borderRadius:
                  BorderRadius.all(Radius.circular(barBorderRadius ?? 8)),
              color: barColor ??
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ),
          ],
        ),
      )
      .toList();
}

class _BarChartModel {
  final double value;
  final String title;

  _BarChartModel(this.value, this.title);
}
