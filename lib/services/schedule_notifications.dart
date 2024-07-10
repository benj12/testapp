
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

  Future<void> scheduleNotificationAt1235(int notificationID, List<String> virtues, List<String> definitions, String payload) async {
    DateTime now = DateTime.now();
    DateTime scheduledDate = DateTime(now.year, now.month, now.day, 12, 53);
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
    scheduledDate = DateTime(now.year, now.month, now.day, 12, 55);
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
    print("Notification payload: ${payload}");
  }

  Future<void> scheduleNotificationsDaily(int notificationID, List<String> virtues, List<String> definitions) async {
    //setting number of days that push notifications will be scheduled daily for
    int numDays = 14;
    try{
      for (int i = 0; i < numDays; i++){
        DateTime notificationTime = DateTime.now().add(Duration(days: i+1)).add(const Duration(hours: 21, minutes: 9, seconds: 59));


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

  // static Future<void> notificationsSchedule(int notificationID, String title, String body) async {
  //   final AwesomeNotifications awesomeNotifications = AwesomeNotifications();
  //   await awesomeNotifications.createNotification(
  //     schedule: NotificationCalendar(
  //       day: 8,
  //       month: 7,
  //       year: 2024,
  //       hour: 21,
  //       minute: 07,
  //       second: 00
  //     ),
  //     content: NotificationContent(
  //       id: Random().nextInt(100),
  //       title: title,
  //       body: body,
  //       channelKey: 'scheduled_notification'
  //     ),
  //   );
  // }

  // NotificationChannel notificationChannel = NotificationChannel(
  //         channelGroupKey: 'reminders',
  //         channelDescription: 'Notification.',
  //         channelKey: 'scheduled_notification',
  //         channelName: 'Scheduled notification',
  //         defaultColor: const Color(0xFF9D50DD),
  // );
  //schedule daily 8 AM notifications
  Future<void> schedule8AMNotify(int id, String title, String body) async {
    //time set for 8 AM
    DateTime scheduledDate = DateTime(8, 0);

    //iOS notification details
    DarwinNotificationDetails iOSDetails = const DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);

    //Notification details object
    NotificationDetails notifyDetails = NotificationDetails(iOS: iOSDetails);

    //send notification at 8 AM daily
    // await flutterLocalNotificationsPlugin.showDailyAtTime(
    //   id,
    //   title,
    //   body,
    //   tz.TZDateTime.from(scheduledDate, tz.local),
    //   notifyDetails,
    //   uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    //   matchDateTimeComponents: DateTimeComponents.dateAndTime
    // );
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

  // Future<void> dailyNotify(int id, String title, String body) async {
  //   final DateTime now = DateTime.now();
  //   final DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
  //   final int hour = 8;
  //   final int minute = 0;

  //   await flutterLocalNotificationsPlugin.scheduleDailyNotification(
  //     id: id,
  //     title: title,
  //     body: body,
  //     notificationPayload: 'daily_notification',
  //     trigger: NotificationTrigger.everyDayAtHourMinute(hour, minute)
  //   );
  // }
  // Future<void> scheduleDaily8AMNotification(int id, String title, String body, ) async {
  //   var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  //   // Android-specific: Configure the notification details
  //   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
  //     'daily_notification',
  //     'Daily Notification',
  //     'Shows a notification at 8 AM daily',
  //     importance: Importance.high,
  //     priority: Priority.high,
  //     channelShowBadge: true,
  //   );

  //   // iOS-specific: Configure the notification details
  //   var iOSPlatformChannelSpecifics = const DarwinNotificationDetails(presentAlert: true, presentBadge: true, presentSound: true);

  //   // General notification details
  //   var platformChannelSpecifics = NotificationDetails(
  //     android: androidPlatformChannelSpecifics,
  //     iOS: iOSPlatformChannelSpecifics,
  //   );

  //   // Schedule the notification at 8 AM
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     id, // Notification ID
  //     title,
  //     body,
  //     _nextInstanceOf8AM(), // Schedule for 8 AM daily
  //     platformChannelSpecifics,
  //     // ignore: deprecated_member_use
  //     androidAllowWhileIdle: true,
  //     uiLocalNotificationDateInterpretation:UILocalNotificationDateInterpretation.absoluteTime,
  //   );
  // }
  // void initializeTimeZones(){
  //   tz.initializeTimeZones();
  // }
  // tz.TZDateTime _nextInstanceOf8AM() {
  //   // Get the current timezone
  //   tz.initializeTimeZones();
  //   tz.setLocalLocation(tz.getLocation('America/New-York'));

  //   // Create a time object set to 8 AM
  //   var now = tz.TZDateTime.now(tz.local);
  //   var scheduledDate =
  //       tz.TZDateTime(tz.local, now.year, now.month, now.day, 8);

  //   // If 8 AM has passed, schedule it for the next day
  //   if (now.isAfter(scheduledDate)) {
  //     scheduledDate = scheduledDate.add(Duration(days: 1));
  //   }

  //   return scheduledDate;
  // }

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

  static tz.TZDateTime _nextInstanceOf12PM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 11, 30);
    if (scheduledDate.isBefore(now)) {
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
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((time) {
      print(time?.format(context));
    });
  }

  // static Future<void> configureLocalTimeZone() async {
  //   if(kIsWeb || Platform.isLinux) {
  //     return;
  //   }
  //   tz.initializeTimeZones();
  //   final String timeZoneName = await FlutterTimezone.getLocalTimezone();
  //   tz.setLocalLocation(tz.getLocation(timeZoneName));
  // }

  Future<void> scheduleDaily9PMNotification(
      int id, String title, String body, String payload) async {
    //Notification details for iOS
    DarwinNotificationDetails iosDetails = const DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);
    NotificationDetails platformChannelSpecifics =
        NotificationDetails(iOS: iosDetails);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id, title, body, nextInstanceOf9PM(), platformChannelSpecifics,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  tz.TZDateTime nextInstanceOf9PM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 22, 25);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  static Future<void> scheduleDaily12PMNotifications(
      String title, String body) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      _nextInstanceOf12PM(),
      const NotificationDetails(
          iOS: DarwinNotificationDetails(
              presentAlert: true, presentBadge: true, presentSound: true)),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  // static Future<void> scheduleMultipleNotifications(String title, String body, DateTime scheduledDate) async {
  //   for (int i = 0; i < 14; i++){
  //     showScheduleNotification(title, body, scheduledDate);
  //   }

  // }
  // TZDateTime _convertTime(int hour) {
  //   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  //   tz.TZDateTime scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, 47);
  //   return scheduleDate;
  // }
  static Future<void> scheduleRepeatedNotifications(
      String title, String body, DateTime scheduledTime) async {
    //DateTime dailyTime = DateTime(12,20,0);
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        iOS: DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true));
    await flutterLocalNotificationsPlugin.periodicallyShow(
        0, title, body, RepeatInterval.daily, platformChannelSpecifics,
        payload: 'New payload');
  }

  static Future<void> scheduleDailyNotifications(
      String title, String body, DateTime scheduledTime) async {
    DarwinNotificationDetails iOSDetails = const DarwinNotificationDetails(
        presentBadge: true, presentAlert: true, presentSound: true);
    NotificationDetails platformChannelSpecifics =
        NotificationDetails(iOS: iOSDetails);
    await flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics, payload: 'New payload');
  }

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
