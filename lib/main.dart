import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/services/schedule_notifications.dart';
import 'package:testapp/screens/home.dart';
import 'package:testapp/screens/test/test1.dart';
import 'package:testapp/screens/test/test2.dart';
import 'package:testapp/screens/test/test3.dart';
import 'package:testapp/screens/test/test4.dart';
import 'package:testapp/screens/test/test5.dart';
import 'package:testapp/screens/test/test6.dart';
import 'package:testapp/screens/test/test7.dart';
import 'package:testapp/screens/test/test8.dart';
import 'package:testapp/screens/test/test9.dart';
import 'package:testapp/screens/test/test10.dart';
import 'package:testapp/screens/test/test11.dart';
import 'package:testapp/screens/test/test12.dart';
import 'package:testapp/screens/test/test13.dart';
import 'package:testapp/screens/test/test14.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  debugPrint("In main function");
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize notifications
  await ScheduleNotificationServices().initializeNotifications();
  
  // Show test notification after a short delay to ensure initialization is complete
  Future.delayed(const Duration(seconds: 2), () async {
    debugPrint('Showing test notification after delay');
    await ScheduleNotificationServices.testNotification();
  });
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Define theme data
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.green,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,
      secondary: Colors.green,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
      routes: {
        '/test1': (context) => const Test1Screen(),
        '/test2': (context) => const Test2Screen(),
        '/test3': (context) => const Test3Screen(),
        '/test4': (context) => const Test4Screen(),
        '/test5': (context) => const Test5Screen(),
        '/test6': (context) => const Test6Screen(), 
        '/test7': (context) => const Test7Screen(),
        '/test8': (context) => const Test8Screen(),
        '/test9': (context) => const Test9Screen(),
        '/test10': (context) => const Test10Screen(),
        '/test11': (context) => const Test11Screen(),
        '/test12': (context) => const Test12Screen(),
        '/test13': (context) => const Test13Screen(),
        '/test14': (context) => const Test14Screen()
      },
    );
  }
}

