import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
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
  bool isDarkMode = false;
  bool _initialized = false;


  //list of routes
  List<String> routes = [
    '/test1',
    '/test2',
    '/test3',
    '/test4',
    '/test5',
    '/test6',
    '/test7',
    '/test8',
    '/test9',
    '/test10',
    '/test11',
    '/test12',
    '/test13',
    '/test14'
  ];

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
    // Show permission dialog after a short delay to ensure the UI is ready
    Future.delayed(const Duration(milliseconds: 500), () {
      _showNotificationPermissionDialog();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      isDarkMode = Theme.of(context).brightness == Brightness.dark;
      _initialized = true;
    }
  }

  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
      Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text('Virtues App'),
        actions: [
          // Theme toggle switch in app bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Icon(
                  isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(width: 8),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) => _toggleTheme(),
                  activeColor: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Image.asset('assets/images/tesla-truck.jpeg', fit: BoxFit.cover),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () => _showAlert(context),
            child: const Text("Show Alert"),
          ),
          
          //const Padding(padding: EdgeInsets.only(bottom: 240)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
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
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
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
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
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
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
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
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
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
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
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
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
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
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
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
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
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
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
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
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
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
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
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
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
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
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
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
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () {
              // Show an instant notification
              ScheduleNotificationServices.showInstantNotification(
                virtues[0],  // title
                definitions[0],  // body
                routes[0]  // route to navigate to when tapped
              );
              
              // Also schedule a notification for 1 minute later
              DateTime scheduledTime = DateTime.now().add(const Duration(minutes: 1));
              ScheduleNotificationServices.showScheduleNotification(
                1,  // different ID to avoid conflicts
                "Scheduled Virtue",
                "This is a scheduled notification",
                scheduledTime
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
              ScheduleNotificationServices.testNotification();
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
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
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
                      // scheduledDates.add(DateTime.now().add(Duration(days:i)));
                      scheduledDates.add(DateTime.now().add(Duration(minutes: i)));
                    }
                    scheduleNotificationServices.dNotifs(virtues, definitions, scheduledDates, routes);
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
              activeTrackColor: Colors.green,
            ),
            // ),
          ),
          Text(
            'Scheduled virtues remaining: ${index--}',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Future<void> _showNotificationPermissionDialog() async {
    if (!mounted) return;
    
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enable Notifications'),
          content: const Text(
            'Would you like to receive notifications for daily virtues and reminders?',
            style: TextStyle(fontSize: 16),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Not Now'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Enable'),
              onPressed: () async {
                // Request notification permissions
                final bool? permissionGranted = await flutterLocalNotificationsPlugin
                    .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
                    ?.requestPermissions(
                  alert: true,
                  badge: true,
                  sound: true,
                  critical: true,
                );
                
                if (permissionGranted == true) {
                  // Show a test notification to confirm it works
                  ScheduleNotificationServices.showInstantNotification(
                    "Notifications Enabled",
                    "You will now receive daily virtue notifications",
                    "/test1"
                  );
                }
                
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
