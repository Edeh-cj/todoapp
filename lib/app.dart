import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_mobile_application/src/home/homepage.dart';

import 'provider/weather.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<WeatherNotifier>(context, listen: false).getweather();
    return MaterialApp(
      home: const Homepage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto-Bold',
      ),
    );
  }
}

