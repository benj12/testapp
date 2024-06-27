import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:testapp/services/local_notification_service.dart';
import 'package:testapp/services/schedule_notifications.dart';
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

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
bool _pressedDailySchedule = false;
bool theme = false;
bool value = false;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  //bool value = true;
  final String acronym = "\nRD FEF KGR FEFEF\n";
  List<String> virtues = ["Test1", "Test2", "Test3", "Test4", "Test5", "Test6", "Test7", "Test8", "Test9", "Test10", "Test11", "Test12", "Test13", "Test14"];
  final String oath = "\nThis is a test paragraph. Dominus vobiscum, et cum spiritu tuo. Kyrie eleison, kyrie eleison. Christe eleison, christe eleison. Kyrie eleison.\n";
  ScheduleNotificationServices scheduleNotificationServices =
      ScheduleNotificationServices();
  @override
  void initState() {
    super.initState();
    scheduleNotificationServices.initializeNotifications();
    LocalNotificationService.initialize(flutterLocalNotificationsPlugin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: Image.asset('assets/images/sky.jpeg', fit: BoxFit.cover),
        toolbarHeight: 200,
        // backgroundColor: Colors.transparent,
        // iconTheme: const IconThemeData(color: Colors.white),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/images/tesla-truck.jpeg', fit: BoxFit.contain, height: 32),
            // padding: const EdgeInsets.all(8.0),
            // child:
            Text('Virtues App'),
          ],
          // Container(

          // ),
        ),
        // title: const Text('Virtues app'),
      ),
      body: ListView(
        // child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //const Padding(padding: EdgeInsets.only(bottom: 240)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test1Screen()),
                );
              },
              child: Text(
                virtues[0],
                style: const TextStyle(
                  decorationThickness: CupertinoScrollbar.defaultThickness,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test2Screen()),
                );
              },
              child: Text(
                virtues[1],
                style: const TextStyle(
                  decorationThickness: CupertinoScrollbar.defaultThickness,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              //TODO: Make a favorites button with a heart icon right by Saints picture
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test3Screen()),
                );
              },
              child: Text(
                virtues[2],
                style: const TextStyle(
                  decorationThickness: CupertinoScrollbar.defaultThickness,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              //TODO: Make a favorites button with a heart icon right by Saints picture
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test4Screen()),
                );
              },
              child: Text(
                virtues[3],
                style: const TextStyle(
                  decorationThickness: CupertinoScrollbar.defaultThickness,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test5Screen()),
                );
              },
              child: Text(
                virtues[4],
                style: const TextStyle(
                  decorationThickness: CupertinoScrollbar.defaultThickness,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            //TODO: Make a favorites button with a heart icon right by Saints picture
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test6Screen()),
                );
              },
              child: Text(
                virtues[5],
                style: const TextStyle(
                  decorationThickness: CupertinoScrollbar.defaultThickness,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test7Screen()),
                );
              },
              child: Text(
                virtues[6],
                style: const TextStyle(
                  decorationThickness: CupertinoScrollbar.defaultThickness,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            //TODO: Make a favorites button with a heart icon right by Saints picture
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test8Screen()),
                );
              },
              child: Text(
                virtues[7],
                style: const TextStyle(
                  decorationThickness: CupertinoScrollbar.defaultThickness,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            //TODO: Make a favorites button with a heart icon right by Saints picture
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test9Screen()),
                );
              },
              child: Text(
                virtues[8],
                style: const TextStyle(
                  decorationThickness: CupertinoScrollbar.defaultThickness,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            //TODO: Make a favorites button with a heart icon right by Saints picture
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test10Screen()),
                );
              },
              child: Text(
                virtues[9],
                style: const TextStyle(
                  decorationThickness: CupertinoScrollbar.defaultThickness,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test11Screen()),
                );
              },
              child: Text(
                virtues[10],
                style: const TextStyle(
                  decorationThickness: CupertinoScrollbar.defaultThickness,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test12Screen()),
                );
              },
              child: Text(
                virtues[11],
                style: const TextStyle(
                  decorationThickness: CupertinoScrollbar.defaultThickness,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test13Screen()),
                );
              },
              child: Text(
                virtues[12],
                style: const TextStyle(
                  decorationThickness: CupertinoScrollbar.defaultThickness,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                // backgroundColor: Colors.lightBlue[50],
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test14Screen()),
                );
              },
              child: Text(
                virtues[13],
                style: const TextStyle(
                  decorationThickness: CupertinoScrollbar.defaultThickness,
                  fontSize: 18,
                ),
              ),
            ),
            Text(
              acronym,
              style: const TextStyle(
                fontSize: 12
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              oath,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                //backgroundColor: const Color.fromARGB(255, 49, 128, 184),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                // scheduleNotificationServices.scheduleNotification(
                //   id++,
                //   "This is a title",
                //   "This is a body",
                // );
                // setState((){
                //   _pressedDailySchedule = !_pressedDailySchedule;
                // });
                ScheduleNotificationServices.showInstantNotification(
                  virtues[0],
                  "body of test"
                );
              },

              child: const Text(
                'Send virtue notification',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                DateTime scheduleDate =
                    DateTime.now().add(const Duration(seconds: 5));
                ScheduleNotificationServices.showScheduleNotification(
                    "Scheduled Notification",
                    "This is the body of a scheduled notification",
                    scheduleDate);
              },
              child: const Text("Schedule Notification"),
            ),
            const Text(
              '\nSchedule notifications for 14 days',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Transform.scale(
              scale: 1.0,
              child: Switch(
                value: value,
                onChanged: (onChanged) {
                  setState(() {
                    value = onChanged;
                    if (value == true) {
                      // DateTime scheduleDate = DateTime.now().add(const Duration(seconds: 10));
                      DateTime scheduledDate = DateTime(11,50,0);
                      // ScheduleNotificationServices.scheduleRepeatedNotifications(
                      //   "Scheduled Notification",
                      //   "This is the body of a scheduled notification",
                      //   scheduleDate
                      // );
                      ScheduleNotificationServices.scheduleDaily12PMNotifications(
                        'Scheduled Daily 11:30 PM Notification',
                        'Body of scheduled 11:30 AM notification',
                      );
                      ScheduleNotificationServices.scheduleDailyRepeatedNotifications(
                        'Scheduled Daily Notification', 
                        'Body of scheduled daily notification', 
                        'payload',
                        scheduledDate
                      );
                    }
                    else{
                      flutterLocalNotificationsPlugin.cancelAll();
                    }
                  });
                },
                // onPressed: (int index) {
                //   DateTime scheduleDate = DateTime.now().add(const Duration(seconds: 5));
                //   ScheduleNotificationServices.showScheduleNotification("Scheduled Notification", "This is the body of a scheduled notification", scheduleDate);
                // }
                activeColor: Colors.green,
                inactiveTrackColor: Colors.red,
                thumbColor: WidgetStateProperty.all(value
                    ? const Color.fromARGB(245, 241, 238, 238)
                    : Color.fromARGB(245, 44, 34, 175)),
              ),
              // ),
            ),
          ],
        ),
      // ),
    );
  }

  // Widget buildIOSSwitch() => Transform.scale(
  //       scale: 1.1,
  //       child: CupertinoSwitch(
  //         value: value,
  //         onChanged: (value) => setState(() => this.value = value),
  //       ),
  //     );
}
