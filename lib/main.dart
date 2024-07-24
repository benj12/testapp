import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/screens/home.dart';
import 'package:testapp/screens/test/test12.dart';
import 'package:testapp/services/schedule_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:testapp/screens/test/test1.dart' as test1;
import 'package:testapp/screens/test/test2.dart' as test2;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScheduleNotificationServices.init();
  tz.initializeTimeZones();
  runApp(const MyApp());
}


final lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.green,
  ),
);

ThemeData light = ThemeData.light();
ThemeData dark = ThemeData.dark();

ThemeData darkTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,
      secondary: Colors.green,
    ),
    scaffoldBackgroundColor: Colors.black,
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      // darkTheme: darkTheme,
      // theme: lightTheme,
      //ThemeMode.system,
      home: HomeScreen(),
    );
  }
}
