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