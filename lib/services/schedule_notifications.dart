import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:testapp/screens/home.dart';
import 'package:timezone/timezone.dart' as tz;

class ScheduleNotificationServices {
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


  static Future<void> onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {

  }
  static Future<void> init() async {

    //initialize settings for android
    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@mipmac/ic_launcher');
    
    //initialize settings for iOS
    const DarwinInitializationSettings iOSInitializationSettings = DarwinInitializationSettings();

    const InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: onDidReceiveNotificationResponse,
    );
  }
  //Android initialization settings
  final AndroidInitializationSettings _androidInitializationSettings = const AndroidInitializationSettings('@mipmap/launcher');

  //ios initialization settings
  DarwinInitializationSettings initializationSettingsiOS = const DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );


  void initializeNotifications() async {
    InitializationSettings initalizationSettings = InitializationSettings(
      android: _androidInitializationSettings, 
      iOS: initializationSettingsiOS
    );

    //initializing the notifications for both iOS and Android
    await _flutterLocalNotificationsPlugin.initialize(initalizationSettings);
  }


  //show instant notification
  static Future<void> showInstantNotification(String title, String body) async {
    //Define Notification details
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      iOS: DarwinNotificationDetails()
    );
    await flutterLocalNotificationsPlugin.show(0, title, body, platformChannelSpecifics);
  }

  //show a schedule notification
  static Future<void> showScheduleNotification(String title, String body, DateTime scheduledDate) async {
    //Define Notification details
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(iOS: DarwinNotificationDetails());
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0, 
      title, 
      body, 
      tz.TZDateTime.from(scheduledDate, tz.local), 
      platformChannelSpecifics, 
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dateAndTime
    );
  }
  static tz.TZDateTime _scheduledDaily(DateTime time){
    final now = tz.TZDateTime.now(tz.local);
    final scheduledTime = tz.TZDateTime(tz.local, now.year, now.month, now.day, time.hour, time.minute, time.second);
    return scheduledTime.isBefore(now) ? scheduledTime.add(const Duration(days: 1)) : scheduledTime;
  }

  static Future<void> scheduleDailyRepeatedNotifications(String title, String body, String payload, DateTime scheduledDate) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      _scheduledDaily(scheduledDate),
      payload: payload,
      const NotificationDetails(iOS: DarwinNotificationDetails()),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime
    );
  }

  static tz.TZDateTime _nextInstanceOf12PM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, 11,30);
    if (scheduledDate.isBefore(now)){
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  // static Future<void> showDailyAtTime() async {
  //   DateTime time = DateTime(11,38,0);
  //   DarwinNotificationDetails iOSNotificationDetails = const DarwinNotificationDetails(presentAlert: true, presentSound: true, presentBadge: true);
  //   NotificationDetails notificationDetails = NotificationDetails(iOS: iOSNotificationDetails);
  //   await flutterLocalNotificationsPlugin.showDailyAtTime(
  //     0,
  //     'Test Title at ${time.hour}',
  //     'Test Body',
  //     time,
  //     notificationDetails,
  //     payload: 'Test Payload',
  //   );
  // }
  timePicking(context) async {
    showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now()
    ).then((time) {
      print(time?.format(context));
    });
  }
  static Future<void> scheduleDaily12PMNotifications(String title, String body) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      _nextInstanceOf12PM(),
      const NotificationDetails(iOS: DarwinNotificationDetails(presentAlert:true, presentBadge: true, presentSound: true)),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
  
  static Future<void> scheduleMultipleNotifications(String title, String body, DateTime scheduledDate) async {
    for (int i = 0; i < 14; i++){
      showScheduleNotification(title, body, scheduledDate);
    }
    
  }

  static Future <void> scheduleRepeatedNotifications(String title, String body, DateTime scheduledTime) async {
    //DateTime dailyTime = DateTime(12,20,0);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(iOS: DarwinNotificationDetails(presentAlert: true, presentBadge: true, presentSound: true));
    await flutterLocalNotificationsPlugin.periodicallyShow(
      0, 
      title, 
      body, 
      RepeatInterval.daily,
      platformChannelSpecifics,
      payload: 'New payload'
    );
  }

  static Future <void> scheduleDailyNotifications(String title, String body, DateTime scheduledTime) async {
    DarwinNotificationDetails iOSDetails = const DarwinNotificationDetails(presentBadge: true, presentAlert: true, presentSound: true);
    NotificationDetails platformChannelSpecifics = NotificationDetails(iOS: iOSDetails);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'New payload'
    );
  }
  void sendNotification(int id, String title, String body) async {

    DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      iOS: darwinNotificationDetails
    );
    
    _flutterLocalNotificationsPlugin.show(
      id,
      title, 
      body, 
      notificationDetails,
    );
  }

  void scheduleNotification(int id, String title, String body) async {
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      presentAlert: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails =
        NotificationDetails(iOS: darwinNotificationDetails);

    _flutterLocalNotificationsPlugin.periodicallyShow(
      id, 
      title, 
      body, 
      RepeatInterval.everyMinute, 
      notificationDetails
    );
  }
}