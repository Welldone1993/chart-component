import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomBarChart<T> extends StatelessWidget {
  const CustomBarChart({
    Key? key,
    required this.bars,
    this.width,
    this.height,
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
    this.distanceFromSide,
    this.backGroundColor,
    this.showGrid,
    this.topAxisWidget,
    this.leftAxisWidget,
    this.rightAxisWidget,
  }) : super(key: key);

  final List<BarChartModel> bars;
  final double? width;
  final double? height;
  final double? barBorderRadius;
  final double? barWidth;
  final Color? barColor;
  final Color? backGroundColor;
  final Gradient? gradient;
  final double? titleAngel;
  final bool? showTopTitles;
  final bool? showRightTitles;
  final bool? showLeftTitles;
  final bool? showBottomTitles;
  final bool? showGrid;
  final Widget? bottomAxisWidget;
  final Widget? topAxisWidget;
  final Widget? leftAxisWidget;
  final Widget? rightAxisWidget;
  final List<T>? model;
  final double? distanceFromSide;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width ?? bars.length * 50,
        height: height ?? bars.length * 50,
        child: Center(
          child: BarChart(_barChartData()),
        ),
      );

  BarChartData _barChartData() {
    return BarChartData(
      gridData: FlGridData(show: showGrid ?? true),
      backgroundColor: backGroundColor,
      barGroups: _barsGenerator(bars),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          axisNameWidget: rightAxisWidget,
          sideTitles: SideTitles(
            reservedSize: distanceFromSide ?? 60,
            showTitles: showRightTitles ?? false,
          ),
        ),
        topTitles: AxisTitles(
          axisNameWidget: topAxisWidget,
          sideTitles: SideTitles(
            reservedSize: distanceFromSide ?? 60,
            showTitles: showTopTitles ?? false,
          ),
        ),
        leftTitles: AxisTitles(
          axisNameWidget: leftAxisWidget,
          sideTitles: SideTitles(
            reservedSize: distanceFromSide ?? 60,
            showTitles: showLeftTitles ?? true,
          ),
        ),
        bottomTitles: AxisTitles(
          axisNameWidget: bottomAxisWidget,
          sideTitles: SideTitles(
            reservedSize: distanceFromSide ?? 60,
            showTitles: showBottomTitles ?? true,
            getTitlesWidget: (value, meta) => SideTitleWidget(
              angle: titleAngel ?? 0.0,
              axisSide: meta.axisSide,
              child: Text(bars[value.toInt()].title),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _barsGenerator(List<BarChartModel> value) => value
      .map(
        (element) => BarChartGroupData(
          x: value.indexOf(element),
          barRods: [
            BarChartRodData(
              gradient: gradient,
              width: barWidth,
              toY: element.value,
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

class BarChartModel {
  final double value;
  final String title;

  BarChartModel(this.value, this.title);
}
