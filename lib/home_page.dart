import 'package:chart_component/bar_chart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
        ),
        body: const Center(
          child: CustomBarChart(
            barValue: [1.2, 2, 3, 4, 5, 4, 7, 8, 9, 15],
          ),
          // IconButton(
          //   onPressed: () {
          //     Navigator.of(context).pushNamed(
          //       '/CustomBarChart',
          //     );
          //   },
          //   icon: const Icon(
          //     CupertinoIcons.chart_bar_alt_fill,
          //     size: 100,
          //     color: Colors.red,
          //   ),
          // ),
        ),
      );
}
