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

  //acronym
  final String acronym = "\nHI EISVS CFCGR SS\n";
  int index = 14;

  //list of virtues
  List<String> virtues = [
    "Humble",
    "Inquisitive",
    "Essentially Focused",
    "Integrated",
    "Studious",
    "Vigilant",
    "Steadfast",
    "Courageous",
    "Faithful",
    "Compassionate",
    "Grateful",
    "Reverent",
    "Simple",
    "Strives for Excellence"
  ];

  //list of virtue definitions
  List<String> definitions = [
    "I am open to all truth, even if it is in the form of a correction",
    "I love learning. I yearn to know the truth. I love the truth. I take an interest in the world, people and God",
    "I strive to keep my thought centered on the essential, not caught up in mere accidents and privations nor in irrelevancies",
    "I am committed to thinking and acting based on grounded principle",
    "I make time each day to study fundamental physics and the truths that grow out of it so that my understanding of it will grow",
    "I am alert so that I will not miss out on opportunities to learn and grow, even when facing difficult circumstances, and to help others do the same.",
    "I will perservere in my commitment to learn and live the truth, especially the fundamental truths on which all others depend, and to help others do the same knowing that God will assist me in His grace",
    "I am willing to enter the battle and unflinchingly attack problems where I find them",
    "I follow through on my IAP commitments.",
    "I go out of my way to understand my fellowman's plight, and do all that I can to help him grow in truth",
    "I will not lose hope in God or the tasks He has given me, but be thankful for all He has given me in my very existence and all the truth He gives me each day, especially through my work with IAP.",
    "I order all my actions towards growth toward the Unchangeable Changer and accept all He offers me",
    "I strive to be intellectually deep and quick and articulate thoughts succintly and clearly without over-complication",
    "I strive to learn completely everything that is in front of me to learn, purging any errors or even imperfections in the essence of my learning"
  ];
  
  //oath
  final String oath =
      "\nIn truth and in the Name of Truth Himself, I will do all that it is in my power to learn and integrate the fundamental physics into my life, especially living out the 14 virtues of an IAP member, and to grow my love for truth; to help my family, friends, and associates do the same; to do all that I can to be the best soldier in the battle to reestablish a healthy, vibrant, grounded culture and defeat the equation-alone based culture.\n";
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
      // appBar: AppBar(
      //   //flexibleSpace: Image.asset('assets/images/256x256.jpeg', fit: BoxFit.cover),
      //   toolbarHeight: 200,
      //   // backgroundColor: Colors.transparent,
      //   // iconTheme: const IconThemeData(color: Colors.white),
      //   title: const Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       // Image.asset('assets/images/tesla-truck.jpeg', fit: BoxFit.contain, height: 32),
      //       // padding: const EdgeInsets.all(8.0),
      //       // child:
      //       Text(
      //         'Virtues App',
      //       ),
      //     ],
      //     // Container(

      //     // ),
      //   ),
      //   // title: const Text('Virtues app'),
      // ),
      
      body: ListView(
        // child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/256x256.jpeg', fit: BoxFit.cover),
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
              ScheduleNotificationServices.showInstantNotification(virtues[0], definitions[0]);
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
                  0,
                  "Scheduled Notification",
                  "This is the body of a scheduled notification",
                  scheduleDate);
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
          
          // ElevatedButton(
          //   onPressed: () async {
          //     await scheduleNotificationServices.notificationsSchedule(0, virtues[0], definitions[0]);
          //   },
          // ),
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
                    // int index = 0;
                    // scheduleNotificationServices.scheduleDaily9PMNotification(
                    //   index,
                    //   virtues[index],
                    //   definitions[index],
                    //   "payload"
                    // );
                    int dummyIndex = 0;
                    // scheduleNotificationServices.notificationsDailyAtSpecificTime(dummyIndex, virtues[dummyIndex], definitions[dummyIndex], "this is a payload");
                    // scheduleNotificationServices.scheduleNotificationDaily(dummyIndex, virtues, definitions, "Switch pressed so the button works! Hip hip hooray!\n");
                    //scheduleNotificationServices.scheduleNotificationAt1235(index, dummyIndex, virtues, definitions, "Payload");
                    scheduleNotificationServices.dNotifs(virtues[0], definitions[0]);
                    //scheduleNotificationServices.scheduleNotificationsDaily(index, dummyIndex, virtues, definitions);
                    // ScheduleNotificationServices.notificationsSchedule(dummyIndex, virtues[0], definitions[0]);
                    //scheduleNotificationServices.dailyNotification(dummyIndex, virtues[dummyIndex], definitions[dummyIndex]);
                  }
                  //if user presses on notification button
                  // if (value == true) {
                  //   DateTime scheduleDate = DateTime.now().add(const Duration(minutes: 1));
                  //   // DateTime scheduledDate = DateTime(16,21,0);
                  //   // for (int index = 0; index < virtues.length; index++) {
                  //   int index = 0;
                  //   ScheduleNotificationServices.showScheduleNotification(
                  //     index,
                  //     virtues[index],
                  //     definitions[index],
                  //     scheduleDate,
                  //   );
                  //   integer = 14 - (index+1);
                  //   index++;
                  //   scheduleDate = DateTime.now().add(const Duration(minutes: 2));
                  //   ScheduleNotificationServices.showScheduleNotification(
                  //     index,
                  //     virtues[index],
                  //     definitions[index],
                  //     scheduleDate,
                  //   );
                  //   index++;
                  //   //third index
                  //   scheduleDate = DateTime.now().add(const Duration(minutes: 3));
                  //   ScheduleNotificationServices.showScheduleNotification(
                  //     index,
                  //     virtues[index],
                  //     definitions[index],
                  //     scheduleDate,
                  //   );
                  //   index++;
                  //   //fourth index
                  //   scheduleDate = DateTime.now().add(const Duration(minutes: 4));
                  //   ScheduleNotificationServices.showScheduleNotification(
                  //     index,
                  //     virtues[index],
                  //     definitions[index],
                  //     scheduleDate,
                  //   );
                  //   //fifth index
                  //   index++;
                  //   scheduleDate = DateTime.now().add(const Duration(minutes: 5));
                  //   ScheduleNotificationServices.showScheduleNotification(
                  //     index,
                  //     virtues[index],
                  //     definitions[index],
                  //     scheduleDate,
                  //   );
                  //   //sixth index
                  //   index++;
                  //   scheduleDate = DateTime.now().add(const Duration(minutes: 6));
                  //   ScheduleNotificationServices.showScheduleNotification(
                  //     index,
                  //     virtues[index],
                  //     definitions[index],
                  //     scheduleDate,
                  //   );
                  //   //seventh index
                  //   index++;
                  //   scheduleDate = DateTime.now().add(const Duration(minutes: 7));
                  //   ScheduleNotificationServices.showScheduleNotification(
                  //     index,
                  //     virtues[index],
                  //     definitions[index],
                  //     scheduleDate,
                  //   );
                  //   //eighth index
                  //   index++;
                  //   scheduleDate = DateTime.now().add(const Duration(minutes: 8));
                  //   ScheduleNotificationServices.showScheduleNotification(
                  //     index,
                  //     virtues[index],
                  //     definitions[index],
                  //     scheduleDate,
                  //   );
                  //   //ninth index
                  //   index++;
                  //   scheduleDate = DateTime.now().add(const Duration(minutes: 9));
                  //   ScheduleNotificationServices.showScheduleNotification(
                  //     index,
                  //     virtues[index],
                  //     definitions[index],
                  //     scheduleDate,
                  //   );
                  //   //tenth index
                  //   index++;
                  //   scheduleDate = DateTime.now().add(const Duration(minutes: 10));
                  //   ScheduleNotificationServices.showScheduleNotification(
                  //     index,
                  //     virtues[index],
                  //     definitions[index],
                  //     scheduleDate,
                  //   );
                  //   //eleventh index
                  //   index++;
                  //   scheduleDate = DateTime.now().add(const Duration(minutes: 11));
                  //   ScheduleNotificationServices.showScheduleNotification(
                  //     index,
                  //     virtues[index],
                  //     definitions[index],
                  //     scheduleDate,
                  //   );
                  //   //twelfth index
                  //   index++;
                  //   scheduleDate = DateTime.now().add(const Duration(minutes: 12));
                  //   ScheduleNotificationServices.showScheduleNotification(
                  //     index,
                  //     virtues[index],
                  //     definitions[index],
                  //     scheduleDate,
                  //   );
                  //   //thirteenth index
                  //   index++;
                  //   scheduleDate = DateTime.now().add(const Duration(minutes: 13));
                  //   ScheduleNotificationServices.showScheduleNotification(
                  //     index,
                  //     virtues[index],
                  //     definitions[index],
                  //     scheduleDate,
                  //   );
                  //   //fourteenth index
                  //   index++;
                  //   scheduleDate = DateTime.now().add(const Duration(minutes: 14));
                  //   ScheduleNotificationServices.showScheduleNotification(
                  //     index,
                  //     virtues[index],
                  //     definitions[index],
                  //     scheduleDate,
                  //   );
                  //   // }
                    // ScheduleNotificationServices
                    //     .scheduleDailyRepeatedNotifications(
                    //   id,
                    //   virtues[0],
                    //   definitions[0],
                    //   "payload",
                    //   scheduleDate,
                    // );
                    // id++;
                    // ScheduleNotificationServices.scheduleDaily12PMNotifications(
                    //   'Scheduled Daily 11:30 PM Notification',
                    //   'Body of scheduled 11:30 AM notification',
                    // );
                    // ScheduleNotificationServices.scheduleDailyRepeatedNotifications(
                    //   'Scheduled Daily Notification',
                    //   'Body of scheduled daily notification',
                    //   'payload',
                    //   scheduledDate
                    // );
                    // DateTime eventDate = DateTime(01,53,0);
                    // TimeOfDay eventTime = const TimeOfDay(hour: 10, minute: 0);
                    // ScheduleNotificationServices.dailyNotificationsScheduler(0, virtues[0], "Test body", eventDate, eventTime, "Test payload");
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
