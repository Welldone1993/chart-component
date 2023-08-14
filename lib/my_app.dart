import 'package:chart_component/bar_chart.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const HomePage(),
          '/CustomBarChart': (context) => const CustomBarChart(),
        },
        initialRoute: '/',
      );
}
