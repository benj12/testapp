// lib/services/notification_service.dart

import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;



class NotificationService {
  static final _plugin = FlutterLocalNotificationsPlugin();
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // 1️⃣ load zone data & set your local location
    tzdata.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('America/New_York'));

    // 2️⃣ init settings + tap callback
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    await _plugin.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
      onDidReceiveNotificationResponse: _onNotificationResponse,
    );

    // 3️⃣ handle cold-start taps
    final details = await _plugin.getNotificationAppLaunchDetails();
    if (details?.didNotificationLaunchApp ?? false) {
      _onNotificationResponse(details!.notificationResponse!);
    }
  }

  static void _onNotificationResponse(NotificationResponse resp) {
    final route = resp.payload;
    if (route == null || route.isEmpty) return;
    navigatorKey.currentState?.pushNamed(route);
  }

  static Future<void> showNow({
    required int id,
    required String title,
    required String body,
    required String routeName,
  }) =>
      _plugin.show(
        id,
        title,
        body,
        const NotificationDetails(),
        payload: routeName,
      );

  static Future<void> scheduleDailyAt({
    required int id,
    required String title,
    required String body,
    required Time time,
    required String routeName,
  }) {
    // helper to find the next instance of your Time
    tz.TZDateTime _nextInstance() {
      final now = tz.TZDateTime.now(tz.local);
      var scheduled = tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
        time.second,
      );
      if (scheduled.isBefore(now)) {
        scheduled = scheduled.add(const Duration(days: 1));
      }
      return scheduled;
    }

    return _plugin.zonedSchedule(
      id,
      title,
      body,
      _nextInstance(),
      const NotificationDetails(),
      payload: routeName,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
