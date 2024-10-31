import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:testapp/screens/home.dart';
import 'package:testapp/screens/test/test12.dart';
import 'package:testapp/services/schedule_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:testapp/screens/test/test1.dart';
import 'package:testapp/screens/test/test2.dart';
import 'package:testapp/screens/test/test3.dart';
import 'package:testapp/screens/test/test4.dart';
import 'package:testapp/screens/test/test4.dart';
import 'package:testapp/screens/test/test5.dart';
// import 'package:workmanager/workmanager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScheduleNotificationServices.init();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  const InitializationSettings initializationSettings = InitializationSettings(
    iOS: DarwinInitializationSettings(
      requestAlertPermission: true, 
      requestBadgePermission: true,
      requestSoundPermission: true, 
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    ),
  );

  flutterLocalNotificationsPlugin.initialize(initializationSettings);
  tz.initializeTimeZones();
  // Workmanager().initialize(callbackDispatcher);
  runApp(MyApp());
}

// void callbackDispatcher() {
//   // Workmanager().executeTask((task, inputData) async {
//   //   // Handle the task
//   //   await showNotification();
//   //   return Future.value(true);
//   // });
// }

Future<void> showNotification() async {
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      // FlutterLocalNotificationsPlugin();

  // final InitializationSettings initializationSettings = InitializationSettings(
  //   iOS: const DarwinInitializationSettings()
  // );

  // await flutterLocalNotificationsPlugin.initialize(initializationSettings);


  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(iOS: DarwinNotificationDetails());
  await flutterLocalNotificationsPlugin.show(
    0,
    'Daily Reminder',
    'It\'s time for your daily notification!',
    platformChannelSpecifics,
  );
}

// tz.TZDateTime _nextInstanceOfTime(int hour, int minutes) {
//   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//   tz.TZDateTime scheduledDateTime =
//       tz.TZDateTime.now(tz.local).add(const Duration(days: 1));

//   if (now.hour >= hour && now.minute >= minutes) {
//     scheduledDateTime = scheduledDateTime.add(const Duration(days: 1));
//   }

//   return scheduledDateTime.copyWith(
//       hour: hour, minute: minutes, second: 0, millisecond: 0);
// }


Future<void> onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
  final navigatorKey = GlobalKey<NavigatorState>();
  navigatorKey.currentState?.push(
    MaterialPageRoute(
      builder: (context) => const Test1Screen(),
    ),
  );
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
  MyApp({super.key});
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    

    // Workmanager().registerPeriodicTask("daily_notification", "simplePeriodicTask", frequency: Duration(minutes: 1), initialDelay: Duration(minutes: 1));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      navigatorKey: navigatorKey,
      // darkTheme: darkTheme,
      // theme: lightTheme,
      //ThemeMode.system,
      home: const HomeScreen(),
      routes: {
        '/test1': (context) => const Test1Screen(),
        '/test2': (context) => const Test2Screen(),
      },
    );
  }
}

