import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/instance_manager.dart';
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
bool theme = false;
bool value = false;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  //bool value = true;

  //acronym
  final String acronym = "\nDO MI NUSVO BRES\n";
  int index = 14;

  //list of virtues
  List<String> virtues = [
    "test1",
    "test2",
    "test3",
    "test4",
    "test5",
    "test6",
    "test7",
    "test8",
    "test9",
    "test10",
    "test11",
    "test12",
    "test13",
    "test14"
  ];

  //list of virtue definitions
  List<String> definitions = [
    "This is Test1",
    "This is test2",
    "This is test3",
    "This is test4",
    "This is test5",
    "This is test6",
    "This is test7",
    "This is test8",
    "This is test9",
    "This is test10",
    "This is test11",
    "This is test12",
    "This is test13",
    "This is test14"
  ];
  
  //oath
  final String oath =
      "\nDominus vobiscum et cum spiritu tuo. Kyrie eleison. Kyrie eleison. Christe eleison. Christe eleison. Kyrie eleison.\n";
  ScheduleNotificationServices scheduleNotificationServices =
      ScheduleNotificationServices();
  @override
  void initState() {
    super.initState();
    scheduleNotificationServices.initializeNotifications();
    LocalNotificationService.initialize(flutterLocalNotificationsPlugin);
  }
  
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    if(Theme.of(context).colorScheme == ThemeData.dark){
      isDarkMode = true;
    }
    else {isDarkMode = false;}
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black: Colors.white,
      extendBodyBehindAppBar: false,
      body: ListView(
        // child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/tesla-truck.jpeg', fit: BoxFit.cover),
          //const Padding(padding: EdgeInsets.only(bottom: 240)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.white,//Theme.of(context).colorScheme.primary,//Colors.blue,
              foregroundColor: Colors.black//Theme.of(context).colorScheme.onPrimary//Colors.white,
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
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
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
              backgroundColor: Colors.white,//Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.black//Theme.of(context).colorScheme.onPrimary,
            ),
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
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
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
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
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
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
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
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
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
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
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
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
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
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
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
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
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
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
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
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
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
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
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
            style: const TextStyle(fontSize: 12),
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
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
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
              
              ScheduleNotificationServices.showInstantNotification(virtues[0], definitions[0], "/test1");
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
              DateTime scheduledDay;
              for (int i = 1; i <= 14; i++){
                scheduledDay = DateTime.now().add(Duration(days: i));
                ScheduleNotificationServices.showScheduleNotification(
                    0,
                    "Scheduled Notification",
                    "This is the body of a scheduled notification",
                    scheduledDay);
              }
              // DateTime firstDay =
              //     DateTime.now().add(const Duration(days: 1));

              
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              //backgroundColor: const Color.fromARGB(255, 49, 128, 184),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
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
            child: CupertinoSwitch(
              value: value,
              onChanged: (onChanged) {
                setState(() {
                  value = onChanged;
                  //if user presses on notification button, notification will be sent
                  if (value == true){
                    int dummyIndex = 0;
                    List <DateTime> scheduledDates = [];
                    for(int i = 1; i <= virtues.length; i++){
                      scheduledDates.add(DateTime.now().add(Duration(days:i)));
                    }
                    scheduleNotificationServices.dNotifs(virtues, definitions, scheduledDates);
                  }
                  
                  //if he decides to cancel the notification, then the notification will be cancelled
                  else {
                    flutterLocalNotificationsPlugin.cancel(0);
                  }
                });
              },
              // onPressed: (int index) {
              //   DateTime scheduleDate = DateTime.now().add(const Duration(seconds: 5));
              //   ScheduleNotificationServices.showScheduleNotification("Scheduled Notification", "This is the body of a scheduled notification", scheduleDate);
              // }
              activeColor: Colors.green,
            ),
            // ),
          ),
          Text(
            'Scheduled virtues remaining: ${index--}',
            textAlign: TextAlign.center,
          ),
        ],
      ),
      // ),
    );
  }
}
