import 'dart:async';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

void _showAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Alert"),
        content: const Text("This is a simple alert dialog."),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class ScheduleNotificationServices {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    debugPrint('Notification tapped!');
    debugPrint('Payload: ${notificationResponse.payload}');

    final String? payload = notificationResponse.payload;
    if (payload != null) {
      try {
        debugPrint('Attempting navigation to: $payload');
        
        // Wait for the app to be in foreground and have a valid context
        await Future.delayed(const Duration(milliseconds: 500));
        
        if (navigatorKey.currentContext != null) {
          debugPrint('Valid context found, proceeding with navigation');
          
          // Get the target screen
          final targetScreen = _getScreenForRoute(payload);
          
          // Use pushReplacement to ensure clean navigation
          await Navigator.of(navigatorKey.currentContext!).pushReplacement(
            MaterialPageRoute(
              builder: (context) => targetScreen,
              settings: RouteSettings(name: payload),
            ),
          );
          
          debugPrint('Navigation completed successfully');
        } else {
          debugPrint('No valid context found for navigation, retrying...');
          // Retry navigation after a short delay
          await Future.delayed(const Duration(seconds: 1));
          if (navigatorKey.currentContext != null) {
            final targetScreen = _getScreenForRoute(payload);
            await Navigator.of(navigatorKey.currentContext!).pushReplacement(
              MaterialPageRoute(
                builder: (context) => targetScreen,
                settings: RouteSettings(name: payload),
              ),
            );
            debugPrint('Navigation completed on retry');
          } else {
            debugPrint('Still no valid context after retry');
          }
        }
      } catch (e, stackTrace) {
        debugPrint('Error during navigation: $e');
        debugPrint('Stack trace: $stackTrace');
      }
    }
  }

  Future<void> initializeNotifications() async {
    debugPrint('In initializeNotifications function');
    
    // Initialize timezone
    tz.initializeTimeZones();
    
    // Request permissions first
    final bool? permissionGranted = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
          critical: true,
        );
    
    debugPrint('Notification permissions granted: $permissionGranted');

    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings iOSInitializationSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {
        debugPrint('Received local notification: $id, $title, $body, $payload');
        if (payload != null) {
          onDidReceiveNotificationResponse(NotificationResponse(
            notificationResponseType: NotificationResponseType.selectedNotification,
            actionId: 'id_$id',
            payload: payload,
          ));
        }
      },
    );

    final InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );

    // Initialize with explicit error handling
    try {
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      );
      debugPrint('Notifications initialized successfully');
    } catch (e) {
      debugPrint('Error initializing notifications: $e');
    }
  }

  Future<void> dNotifs(
    List<String> titles,
    List<String> bodies,
    List<DateTime> scheduledDates,
    List<String> routes,
  ) async {
    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      presentBanner: true,
      sound: 'default',
      threadIdentifier: 'thread_id',
      categoryIdentifier: 'default',
      interruptionLevel: InterruptionLevel.active,
      attachments: null,
    );

    const NotificationDetails notDetails = NotificationDetails(
      iOS: iosDetails,
      android: AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );

    for (int i = 0; i < titles.length; i++) {
      try {
        // Cancel any existing notification with this ID
        await flutterLocalNotificationsPlugin.cancel(i);

        final scheduledTime = tz.TZDateTime.from(scheduledDates[i], tz.local);
        debugPrint('Scheduling notification $i');
        debugPrint('Title: ${titles[i]}');
        debugPrint('Body: ${bodies[i]}');
        debugPrint('Route: ${routes[i]}');
        debugPrint('Scheduled time: $scheduledTime');
        debugPrint('Payload for notification $i: ${routes[i]}');

        await flutterLocalNotificationsPlugin.zonedSchedule(
            i, titles[i], bodies[i], scheduledTime, notDetails,
            payload: routes[i],
            androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime);

        // Verify notification was scheduled
        final pendingNotifs =
            await flutterLocalNotificationsPlugin.pendingNotificationRequests();
        debugPrint('Pending notifications: ${pendingNotifs.length}');
      } catch (e, stackTrace) {
        debugPrint('Error scheduling notification: $e');
        debugPrint('Stack trace: $stackTrace');
      }
    }
  }

  Future<void> cronScheduler(String title, String body) async {
    //initialize IOS notification details and put them in NotificationDetails object
    DarwinNotificationDetails iosDetails = const DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: false);
    NotificationDetails notDetails = NotificationDetails(iOS: iosDetails);

    //show notifications daily using a cron job
    final cron = Cron();
  }

  Future<void> scheduleNotificationDaily(int notificationID,
      List<String> virtues, List<String> definitions, String payload) async {
    DateTime now = DateTime.now();
    DateTime tomorrow = now.add(const Duration(days: 1));
    DateTime notificationTime =
        tomorrow.add(const Duration(hours: 8, minutes: 15, seconds: 0));
    tz.TZDateTime scheduledTime =
        tz.TZDateTime.from(notificationTime, tz.local);
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
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);

    print("Notification toggle switch pressed: $payload");
  }

  Future<void> scheduleNotificationAt1235(int counter, int notificationID,
      List<String> virtues, List<String> definitions, String payload) async {
    DateTime notificationDate = DateTime.now().add(const Duration(hours: 10));
    DateTime now = DateTime.now();
    DateTime scheduledDate = DateTime(now.year, now.month, now.day, 22, 40);
    DarwinNotificationDetails ios = const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        presentBanner: true);
    NotificationDetails notificationDetails = NotificationDetails(iOS: ios);
    tz.TZDateTime scheduledTime =
        tz.TZDateTime.from(notificationDate, tz.local);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        notificationID,
        virtues[notificationID],
        definitions[notificationID],
        scheduledTime,
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
    counter--;
  }

  Future<void> scheduleNotificationsDaily(int counter, int notificationID,
      List<String> virtues, List<String> definitions) async {
    //setting number of days that push notifications will be scheduled daily for
    int numDays = 14;
    try {
      for (int i = 0; i < numDays; i++) {
        DateTime notificationTime = DateTime.now()
            .add(Duration(days: i + 1))
            .add(const Duration(hours: 6, minutes: 0, seconds: 0));

        //NotificationDetails
        DarwinNotificationDetails iosDetails = const DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true);
        NotificationDetails platformChannelSpecifics =
            NotificationDetails(iOS: iosDetails);

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
    } catch (e) {
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

  Future<void> notificationsDailyAtSpecificTime(
      int id, String title, String body, String payload) async {
    const int hour = 15;
    const int minute = 20;
    DateTime now = DateTime.now();
    DateTime scheduledDate =
        DateTime(now.year, now.month, now.day, hour, minute);

    const NotificationDetails notificationDetails = NotificationDetails(
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(id, title, body,
        tz.TZDateTime.from(scheduledDate, tz.local), notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime);
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
  static Future<void> showInstantNotification(
      String title, String body, String route) async {
    debugPrint('Showing instant notification with route: $route');
    
    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      presentBanner: true,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      iOS: iosDetails,
      android: AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: true,
        enableLights: true,
        enableVibration: true,
      ),
    );

    try {
      await flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        platformChannelSpecifics,
        payload: route,
      );
      debugPrint('Instant notification shown successfully');
    } catch (e) {
      debugPrint('Error showing instant notification: $e');
    }
  }

  //show a schedule notification
  static Future<void> showScheduleNotification(
      int id, String title, String body, DateTime scheduledDate) async {
    debugPrint('Scheduling notification for: $scheduledDate');
    
    // Ensure timezone is initialized
    tz.initializeTimeZones();
    
    //Define Notification details
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
      android: AndroidNotificationDetails(
        'scheduled_channel',
        'Scheduled Notifications',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: true,
      ),
    );

    try {
      final scheduledTime = tz.TZDateTime.from(scheduledDate, tz.local);
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        scheduledTime,
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
      debugPrint('Notification scheduled successfully for: $scheduledTime');
    } catch (e) {
      debugPrint('Error scheduling notification: $e');
    }
  }

  tz.TZDateTime _scheduledDaily(DateTime time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduledTime = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    return scheduledTime.isBefore(now)
        ? scheduledTime.add(const Duration(days: 1))
        : scheduledTime;
  }

  Future<void> scheduleDailyRepeatedNotifications(int id, String title,
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

  Future<void> dailyNotificationsScheduler(int id, String title, String body,
      DateTime eventDate, TimeOfDay eventTime, String payload,
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

  void sendNotification(int id, String title, String body) async {
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      presentAlert: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails =
        NotificationDetails(iOS: darwinNotificationDetails);

    flutterLocalNotificationsPlugin.show(
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

    flutterLocalNotificationsPlugin.periodicallyShow(
        id, title, body, RepeatInterval.everyMinute, notificationDetails);
  }

  static Future<void> testNotification() async {
    debugPrint('Showing test notification...');
    
    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      presentBanner: true,
    );

    const NotificationDetails details = NotificationDetails(
      iOS: iosDetails,
      android: AndroidNotificationDetails(
        'test_channel',
        'Test Channel',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: true,
        enableLights: true,
        enableVibration: true,
      ),
    );

    const String payload = '/test1';
    debugPrint('Test notification payload: $payload');

    try {
      await flutterLocalNotificationsPlugin.show(
        999,
        'Test Notification',
        'Tap me to test navigation',
        details,
        payload: payload,
      );
      debugPrint('Test notification shown successfully');
    } catch (e) {
      debugPrint('Error showing test notification: $e');
    }
  }

  static Widget _getScreenForRoute(String route) {
    debugPrint('Routing to: $route');
    switch (route) {
      case '/test1':
        return const Test1Screen();
      case '/test2':
        return const Test2Screen();
      case '/test3':
        return const Test3Screen();
      case '/test4':
        return const Test4Screen();
      case '/test5':
        return const Test5Screen();
      case '/test6':
        return const Test6Screen();
      case '/test7':
        return const Test7Screen();
      case '/test8':
        return const Test8Screen();
      case '/test9':
        return const Test9Screen();
      case '/test10':
        return const Test10Screen();
      case '/test11':
        return const Test11Screen();
      case '/test12':
        return const Test12Screen();
      case '/test13':
        return const Test13Screen();
      case '/test14':
        return const Test14Screen();
      default:
        throw Exception('Unknown route: $route');
    }
  }
}
