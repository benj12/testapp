import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotifyManager{
  static final _notifications = FlutterLocalNotificationsPlugin();
  static Future init({bool scheduled = false}) async {
    AndroidInitializationSettings initAndroidSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings ios = const DarwinInitializationSettings();
    final InitializationSettings settings = InitializationSettings(android: initAndroidSettings, iOS: ios);
    await _notifications.initialize(settings);
  }
  static Future showNotification({
    var id = 0,
    var title,
    var body,
    var payload, 

  }) async =>
    _notifications.show(id, title, body, await notificationDetails());

  static Future showScheduledNotification({
    var id = 0,
    var title, 
    var body,
    var payload,
    required DateTime scheduleTime
  }) async => 
    _notifications.zonedSchedule(
      id, 
      title, 
      body,
      tz.TZDateTime.from(scheduleTime, tz.local),
      await notificationDetails(),
      payload: payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime
    );
    static tz.TZDateTime _scheduledDaily(DateTime time){
      final now = tz.TZDateTime.now(tz.local);
      final scheduledTime = tz.TZDateTime(
        tz.local, 
        now.year, 
        now.month, 
        now.day, 
        time.hour,
        time.minute,
        time.second
      );
      print('test now time $now');
      print('test schedule time $scheduledTime');

      return scheduledTime.isBefore(now)
          ? scheduledTime.add(const Duration(days: 1))
          : scheduledTime;
    }
    static Future showScheduledDailyNotification({
      var id = 0,
      var title,
      var body,
      var payload
    }) async => 
      _notifications.zonedSchedule(id, title, body, _scheduledDaily(DateTime(04,59)),
      await notificationDetails(),
      payload: payload, 
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time);


    static notificationDetails() async {
      return const NotificationDetails(
        android: AndroidNotificationDetails(
          'channel id 9',
          'channel name',
          importance: Importance.max,
        ),
        iOS: DarwinNotificationDetails(sound: 'notification.mp3')
      );
    }
}

// class LocalNotifyManager{
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//   var initSetting;
//   BehaviorSubject<ReceiveNotification> get didReceiveLocalNotificationSubject =>
//                                 BehaviorSubject<ReceiveNotification>();
  
//   LocalNotifyManager.init() {
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     if(Platform.isIOS) {
//       requestIOSPermission();
//     }
//     initializePlatform();
//   }
  
//   requestIOSPermission(){
//     flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }

//   initializePlatform() {
//     var initSettingsAndroid = const AndroidInitializationSettings('/assets/images/tesla-truck.jpeg');
//     var initSettingsIOS = const DarwinInitializationSettings(
//       requestSoundPermission: true,
//       requestBadgePermission: true,
//       requestAlertPermission: true,
//       onDidReceiveLocalNotification: (id, title, body, payload) async {
//         ReceiveNotification notification = ReceiveNotification(id: id, title: title, body: body, payload: payload);
//         didReceiveLocalNotificationSubject.add(notification);
//       }

//     );
//     initSetting = InitializationSettings(android: initSettingsAndroid, iOS: initSettingsIOS);

//   }
//   setOnNotificationReceive(Function onNotificationReceive) {
//     didReceiveLocalNotificationSubject.listen((notification) {
//       onNotificationReceive(notification);
//     });
//   }
//   setOnNotificationClick(Function onNotificationClick) async {
//     await flutterLocalNotificationsPlugin.initialize(
//       initSetting, 
//       onSelectNotification: (String payload) async {
//         onNotificationClick(payload);
//       }
//     );
//   }
// }

// class ReceiveNotification {
//   final int id;
//   final String title;
//   final String body;
//   final String payload;
//   ReceiveNotification({
//     @required this.id,
//     @required this.title,
//     @required this.body,
//     @required this.payload,
//   });
// }