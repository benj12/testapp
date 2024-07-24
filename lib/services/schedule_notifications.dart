
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:testapp/screens/home.dart';
//import 'package:/timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class ScheduleNotificationServices {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {}
  static Future<void> init() async {
    //initialize settings for android
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmac/ic_launcher');

    //initialize settings for iOS
    const DarwinInitializationSettings iOSInitializationSettings =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveNotificationResponse,
    );
  }

  //Android initialization settings
  final AndroidInitializationSettings _androidInitializationSettings =
      const AndroidInitializationSettings('@mipmap/launcher');

  //ios initialization settings
  DarwinInitializationSettings initializationSettingsiOS =
      const DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );

  void initializeNotifications() async {
    InitializationSettings initalizationSettings = InitializationSettings(
        android: _androidInitializationSettings,
        iOS: initializationSettingsiOS);

    //initializing the notifications for both iOS and Android
    await _flutterLocalNotificationsPlugin.initialize(initalizationSettings);
  }

  Future<void> scheduleNotificationDaily(int notificationID, List<String> virtues, List<String> definitions, String payload) async {
    DateTime now = DateTime.now();
    DateTime tomorrow = now.add(const Duration(days: 1));
    DateTime notificationTime = tomorrow.add(const Duration(hours: 8, minutes: 15, seconds: 0));
    tz.TZDateTime scheduledTime = tz.TZDateTime.from(notificationTime, tz.local);
    DarwinNotificationDetails ios = const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        presentBanner: true);
    NotificationDetails notificationDetails = NotificationDetails(iOS: ios);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      notificationID,
      virtues[notificationID],
      definitions[notificationID],
      scheduledTime,
      notificationDetails,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime
    );

    print("Notification toggle switch pressed: $payload");


  }


  Future<void> scheduleNotificationAt1235(int counter, int notificationID, List<String> virtues, List<String> definitions, String payload) async {
    DateTime now = DateTime.now();
    DateTime scheduledDate = DateTime(now.year, now.month, now.day, 16, 44);
    DarwinNotificationDetails ios = const DarwinNotificationDetails(presentAlert: true, presentBadge: true, presentSound: true, presentBanner: true);
    NotificationDetails notificationDetails = NotificationDetails(iOS: ios);
    tz.TZDateTime scheduledTime = tz.TZDateTime.from(scheduledDate, tz.local);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      notificationID, 
      virtues[notificationID], 
      definitions[notificationID], 
      scheduledTime, 
      notificationDetails, 
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime
    );
    counter--;
    scheduledDate = DateTime(now.year, now.month, now.day, 16, 45);
    scheduledTime = tz.TZDateTime.from(scheduledDate, tz.local);
    notificationID++;
    await flutterLocalNotificationsPlugin.zonedSchedule(
      notificationID, 
      virtues[notificationID], 
      definitions[notificationID], 
      scheduledTime, 
      notificationDetails, 
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime
    );
    counter--;
    scheduledDate = DateTime(now.year, now.month, now.day, 16, 46);
    scheduledTime = tz.TZDateTime.from(scheduledDate, tz.local);
    notificationID++;
    await flutterLocalNotificationsPlugin.zonedSchedule(
        notificationID,
        virtues[notificationID],
        definitions[notificationID],
        scheduledTime,
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
    counter--;
    scheduledDate = DateTime(now.year, now.month, now.day, 16, 47);
    scheduledTime = tz.TZDateTime.from(scheduledDate, tz.local);
    notificationID++;
    await flutterLocalNotificationsPlugin.zonedSchedule(
        notificationID,
        virtues[notificationID],
        definitions[notificationID],
        scheduledTime,
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
    counter--;
    
    print("Notification payload: $payload");
    
  }

  Future<void> scheduleNotificationsDaily(int counter, int notificationID, List<String> virtues, List<String> definitions) async {
    //setting number of days that push notifications will be scheduled daily for
    int numDays = 14;
    try{
      for (int i = 0; i < numDays; i++){
        DateTime notificationTime = DateTime.now().add(Duration(days: i+1)).add(const Duration(hours: 6, minutes: 0, seconds: 0));


        //NotificationDetails
        DarwinNotificationDetails iosDetails = const DarwinNotificationDetails(presentAlert: true, presentBadge: true, presentSound: true);
        NotificationDetails platformChannelSpecifics = NotificationDetails(iOS: iosDetails);

        // Notification title and body (example)
        String notificationTitle = virtues[i];
        String notificationBody = definitions[i];

        // Schedule the notification
        await flutterLocalNotificationsPlugin.zonedSchedule(
          notificationID,
          notificationTitle,
          notificationBody,
          _nextInstanceOf(notificationTime),
          platformChannelSpecifics,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
        );

        // Save notification ID to SharedPreferences
        // await prefs.setInt('notificationId', notificationID);

        // Increment notification ID for the next notification
        notificationID++;
      }
    } catch(e){
      print('Error scheduling notifications: $e');
    }
  }


  
  tz.TZDateTime _nextInstanceOf(DateTime scheduledTime) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      scheduledTime.year,
      scheduledTime.month,
      scheduledTime.day,
      scheduledTime.hour,
      scheduledTime.minute,
    );
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }


  Future<void> notificationsDailyAtSpecificTime(int id, String title, String body, String payload) async {
    const int hour = 15;
    const int minute = 20;
    DateTime now = DateTime.now();
    DateTime scheduledDate = DateTime(now.year, now.month, now.day, hour, minute);

    const NotificationDetails notificationDetails = NotificationDetails(
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id, 
      title, 
      body, 
      tz.TZDateTime.from(scheduledDate, tz.local), 
      notificationDetails, 
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dateAndTime
    );
  }


  Future<void> dailyNotification(int id, String title, String body) async {
    //specific time to schedule notification
    DateTime scheduledDate = DateTime.now().add(const Duration(days: 1));

    //iOS notification details
    DarwinNotificationDetails iosDetails = const DarwinNotificationDetails(
        presentBadge: true, presentAlert: true, presentSound: true);

    //NotificationDetails object creation and initialization
    NotificationDetails notifDetails = NotificationDetails(iOS: iosDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(id, title, body,
        tz.TZDateTime.from(scheduledDate, tz.local), notifDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime);
  }

  //show instant notification
  static Future<void> showInstantNotification(String title, String body) async {
    //Define Notification details
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(iOS: DarwinNotificationDetails());
    await flutterLocalNotificationsPlugin.show(
        0, title, body, platformChannelSpecifics);
  }

  //show a schedule notification
  static Future<void> showScheduleNotification(
      int id, String title, String body, DateTime scheduledDate) async {
    //Define Notification details
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(iOS: DarwinNotificationDetails());
    await flutterLocalNotificationsPlugin.zonedSchedule(id, title, body,
        tz.TZDateTime.from(scheduledDate, tz.local), platformChannelSpecifics,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime);
  }

  static tz.TZDateTime _scheduledDaily(DateTime time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduledTime = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    return scheduledTime.isBefore(now)
        ? scheduledTime.add(const Duration(days: 1))
        : scheduledTime;
  }

  static Future<void> scheduleDailyRepeatedNotifications(int id, String title,
      String body, String payload, DateTime scheduledDate) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        _scheduledDaily(scheduledDate),
        payload: payload,
        const NotificationDetails(iOS: DarwinNotificationDetails()),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
  }

  static Future<void> dailyNotificationsScheduler(int id, String title,
      String body, DateTime eventDate, TimeOfDay eventTime, String payload,
      [DateTimeComponents? dateTimeComponents]) async {
    final scheduledTime = eventDate.add(Duration(
      hours: eventTime.hour,
      minutes: eventTime.minute,
    ));
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id++,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      const NotificationDetails(
          iOS: DarwinNotificationDetails(
              presentAlert: true, presentBadge: true, presentSound: true)),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: payload,
      matchDateTimeComponents: dateTimeComponents,
    );
  }


  // static Future<void> configureLocalTimeZone() async {
  //   if(kIsWeb || Platform.isLinux) {
  //     return;
  //   }
  //   tz.initializeTimeZones();
  //   final String timeZoneName = await FlutterTimezone.getLocalTimezone();
  //   tz.setLocalLocation(tz.getLocation(timeZoneName));
  // }



  void sendNotification(int id, String title, String body) async {
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      presentAlert: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails =
        NotificationDetails(iOS: darwinNotificationDetails);

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
        id, title, body, RepeatInterval.everyMinute, notificationDetails);
  }
}
