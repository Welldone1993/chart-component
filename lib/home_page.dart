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
            width: 250,
            height: 250,
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
