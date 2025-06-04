import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controllers/theme_controller.dart';
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
  final notificationService = ScheduleNotificationServices();
  await notificationService.initializeNotifications();
  
  // Initialize theme controller
  final themeController = Get.put(ThemeController());
  
  runApp(
    GetMaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: '/',
      theme: ThemeController.lightTheme,
      darkTheme: ThemeController.darkTheme,
      themeMode: ThemeMode.system,
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/test1', page: () => const Test1Screen()),
        GetPage(name: '/test2', page: () => const Test2Screen()),
        GetPage(name: '/test3', page: () => const Test3Screen()),
        GetPage(name: '/test4', page: () => const Test4Screen()),
        GetPage(name: '/test5', page: () => const Test5Screen()),
        GetPage(name: '/test6', page: () => const Test6Screen()),
        GetPage(name: '/test7', page: () => const Test7Screen()),
        GetPage(name: '/test8', page: () => const Test8Screen()),
        GetPage(name: '/test9', page: () => const Test9Screen()),
        GetPage(name: '/test10', page: () => const Test10Screen()),
        GetPage(name: '/test11', page: () => const Test11Screen()),
        GetPage(name: '/test12', page: () => const Test12Screen()),
        GetPage(name: '/test13', page: () => const Test13Screen()),
        GetPage(name: '/test14', page: () => const Test14Screen()),
      ]
    )
  );
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeController.lightTheme,
      darkTheme: ThemeController.darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.fade,
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

