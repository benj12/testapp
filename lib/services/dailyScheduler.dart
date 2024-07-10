// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Scheduled Notifications',
//       home: NotificationScheduler(),
//     );
//   }
// }

// class NotificationScheduler extends StatefulWidget {
//   @override
//   _NotificationSchedulerState createState() => _NotificationSchedulerState();
// }

// class _NotificationSchedulerState extends State<NotificationScheduler> {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   SharedPreferences prefs;
//   int notificationId = 0;

//   @override
//   void initState() {
//     super.initState();
//     tz.initializeTimeZones();
//     initializeNotifications();
//   }

//   Future<void> initializeNotifications() async {
//     var initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     var initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: onSelectNotification);
//     prefs = await SharedPreferences.getInstance();
//     notificationId = prefs.getInt('notificationId') ?? 0;
//   }

//   Future<void> scheduleNotifications() async {
//     try {
//       for (int i = 1; i <= 14; i++) {
//         // Calculate notification time (daily at 8:00 AM)
//         DateTime notificationTime =
//             DateTime.now().add(Duration(days: i)).add(Duration(hours: 8));

//         // Notification details
//         var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//           'daily_notifications_channel',
//           'Daily Notifications',
//           'Scheduled daily notifications',
//           importance: Importance.max,
//           priority: Priority.high,
//         );
//         var platformChannelSpecifics =
//             NotificationDetails(android: androidPlatformChannelSpecifics);

//         // Notification title and body (example)
//         String notificationTitle = 'Day $i';
//         String notificationBody = 'Notification body for day $i';

//         // Schedule the notification
//         await flutterLocalNotificationsPlugin.zonedSchedule(
//           notificationId,
//           notificationTitle,
//           notificationBody,
//           _nextInstanceOf(notificationTime),
//           platformChannelSpecifics,
//           androidAllowWhileIdle: true,
//           uiLocalNotificationDateInterpretation:
//               UILocalNotificationDateInterpretation.absoluteTime,
//         );

//         // Save notification ID to SharedPreferences
//         await prefs.setInt('notificationId', notificationId);

//         // Increment notification ID for the next notification
//         notificationId++;
//       }
//     } catch (e) {
//       // Handle and log the error
//       print('Error scheduling notifications: $e');
//     }
//   }

//   tz.TZDateTime _nextInstanceOf(DateTime scheduledTime) {
//     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     tz.TZDateTime scheduledDate = tz.TZDateTime(
//       tz.local,
//       scheduledTime.year,
//       scheduledTime.month,
//       scheduledTime.day,
//       scheduledTime.hour,
//       scheduledTime.minute,
//     );
//     if (scheduledDate.isBefore(now)) {
//       scheduledDate = scheduledDate.add(Duration(days: 1));
//     }
//     return scheduledDate;
//   }

//   Future<void> onSelectNotification(String payload) async {
//     // Handle notification tap here
//     print('Notification tapped: $payload');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scheduled Notifications'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             scheduleNotifications();
//           },
//           child: Text('Schedule Notifications'),
//         ),
//       ),
//     );
//   }
// }
