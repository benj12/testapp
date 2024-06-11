import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

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