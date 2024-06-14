import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:testapp/services/local_notification_service.dart';
import 'package:testapp/screens/test/test1.dart';
import 'package:testapp/screens/test/test2.dart';
import 'package:testapp/screens/test/test3.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = 
  FlutterLocalNotificationsPlugin();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  
  @override
  void initState () {
    super.initState();
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
      body: Center(
        child: Column (
        children: <Widget> [
          const Padding(
            padding: EdgeInsets.only(bottom: 240)
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.lightBlue[50],
              foregroundColor: Colors.black,
            ),
            //TODO: Make a favorites button with a heart icon right by Saints picture
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Test1Screen()),
              );
            },
            child: const Text(
              'Test1',
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.lightBlue[50],
              foregroundColor: Colors.black,
            ),
            //TODO: Make a favorites button with a heart icon right by Saints picture
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Test2Screen()),
              );
            },
            child: const Text(
              'Test2',
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.lightBlue[50],
              foregroundColor: Colors.black,
            ),
            //TODO: Make a favorites button with a heart icon right by Saints picture
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Test3Screen()),
              );
            },
            child: const Text(
              'Test3',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              LocalNotificationService.showBigTextNotification(
                title: 'New message title', 
                body: 'body', 
                flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin
              );
            },
            child: const Text(
              'Send push notification',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}