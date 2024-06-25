import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/subjects.dart';
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


class LocalNotificationService {
  // final TextEditingController _date = TextEditingController();


  static final LocalNotificationService _notificationService = LocalNotificationService._internal();
  LocalNotificationService._internal();
  
  factory LocalNotificationService() {
    return _notificationService;
  }

  static Future initialize (FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialization = const AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings initializationSettingsiOS = const DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    final InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitialization,
      iOS: initializationSettingsiOS,
      macOS: null,
      linux: null,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // static Future showNotification(int id, String title, String body) async {
  //   const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
  //     presentSound: false,
  //   );
  //   // await flutterLocalNotificationsPlugin.zonedSchedule(
  //   //   id,
  //   //   title,
  //   //   body,
  //   //   tz.TZDateTime.now(tz.local).add(const Duration(seconds: 1)),
  //   //   const NotificationDetails(
  //   //     iOS: darwinNotificationDetails,
  //   //   ),
  //   // );
  // }
  static Future showBigTextNotification ({
    var id = 0,
    required String title,
    required String body,
    var payload,
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  }) async {
    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
      'you_can_name_it_whatever1',
      'channel_name',
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
    );
    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
      presentSound: false,
    );

    var notify = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(0, title, body, notify);
  }

  // static void showScheduledDailyNotification({
  //   int id = 0,
  //   String? title,
  //   String? body,
  //   String? payload,
  // }) async =>
  //   _notificationService.zonedSchedule(
  //     id,
  //     title,
  //     body,
  //     await _notificationDetails(),
  //     payload: payload,
  //   );
}


// class LocalNotificationService {
//   LocalNotificationService();

//   static final _localNotificationService = FlutterLocalNotificationsPlugin();

//   Future<void> initialize() async {
//     const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@drawable');
//     const iOSInitializationSettings iosInitializationSettings = iOSInitializationSettings(
//       requestAlertPermission: true,
//     );
//   }
//   static Future showNotification({
//     int id = 0,
//     String? title,
//     String? body,
//     String? payload,
//   }) async => 
//      _notifications.show(
//        id,
//        title,
//        body,
//        await _notificationDetails(),
//        payload: payload,
//      );
// }