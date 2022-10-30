import 'package:flutter/material.dart';
import 'package:todo_mobile_application/app.dart';
import 'package:todo_mobile_application/getit.dart';
import 'package:todo_mobile_application/provider/appcolor.dart';
import 'package:todo_mobile_application/provider/todolist.dart';
import 'package:todo_mobile_application/provider/weather.dart';
import 'package:provider/provider.dart';


void main() {
  initLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ColorThemeNotifier()),
        ChangeNotifierProvider(create: (context) => TodoNotifier()),
        ChangeNotifierProvider(create: (context) => WeatherNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}