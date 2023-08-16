import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomPieChart extends StatefulWidget {
  const CustomPieChart({
    required this.section,
    super.key,
    this.showTitle,
    this.titleStyle,
    this.centerColor,
    this.angel,
    this.spaceBetween,
    this.radius,
    this.diameter,
    this.largeSectionThickness,
    this.defaultSectionThickness,
    this.titleByPercent = false,
    this.hasMotion = false,
  });

  final List<PieChartSectionModel> section;
  final bool? showTitle;
  final bool titleByPercent;
  final bool hasMotion;
  final TextStyle? titleStyle;
  final Color? centerColor;
  final double? angel;
  final double? spaceBetween;
  final double? radius;
  final double? largeSectionThickness;
  final double? defaultSectionThickness;
  final double? diameter;

  @override
  State<CustomPieChart> createState() => _CustomPieChartState();
}

class _CustomPieChartState extends State<CustomPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: widget.diameter,
        height: widget.diameter,
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              enabled: true,
              touchCallback: _touchResponse,
            ),
            startDegreeOffset: widget.angel,
            sectionsSpace: widget.spaceBetween ?? 0,
            centerSpaceRadius: widget.radius ?? 0,
            sections: _section(widget.section),
            centerSpaceColor: widget.centerColor,
          ),
        ),
      );

  void _touchResponse(FlTouchEvent event, PieTouchResponse? pieTouchResponse) {
    if (widget.hasMotion) {
      setState(
        () {
          if (!event.isInterestedForInteractions ||
              pieTouchResponse == null ||
              pieTouchResponse.touchedSection == null) {
            touchedIndex = -1;

            return;
          }
          touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
        },
      );
    }
  }

  List<PieChartSectionData> _section(List<PieChartSectionModel> sectionsList) {
    final overAllValues = sectionsList.fold(
      0.0,
      (previousValue, element) => previousValue + element.value,
    );

    return sectionsList
        .map(
          (section) => PieChartSectionData(
            radius: (_isTouched(sectionsList.indexOf(section)))
                ? widget.largeSectionThickness ?? 40
                : widget.defaultSectionThickness ?? 30,
            color: section.color,
            title: widget.titleByPercent
                ? _averageByPercent(section, overAllValues)
                : section.title,
            value: section.value,
            showTitle: widget.showTitle ?? true,
            titleStyle: widget.titleStyle ??
                TextStyle(
                  fontSize:
                      (_isTouched(sectionsList.indexOf(section))) ? 30 : 10,
                ),
          ),
        )
        .toList();
  }

  String _averageByPercent(
    PieChartSectionModel section,
    double overAllValues,
  ) =>
      '${((section.value / overAllValues) * 100).toStringAsFixed(2)}%';

  bool _isTouched(int index) => touchedIndex == index;
}

class PieChartSectionModel {
  final double value;
  final String? title;
  final Color? color;

  PieChartSectionModel({
    required this.value,
    this.title,
    this.color,
  });
}
