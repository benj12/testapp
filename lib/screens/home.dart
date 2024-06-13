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
      appBar: AppBar(
        title: const Text('Virtues app'),
      ),
      body: Center(
        child: Column (
        children: <Widget> [
          const Padding(
            padding: EdgeInsets.only(bottom: 25)
          ),
          Image.asset(
            "assets/images/tesla-truck.jpeg",
            height: 200,
            width: 200
          ),
        // SizedBox(
        //   width: 180,
        //   height: 50,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.red,
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
              backgroundColor: Colors.red,
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
              backgroundColor: Colors.red,
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
          // ElevatedButton(
          //   onPressed: () {
          //     LocalNotificationService.showBigTextNotification(
          //       title: 'New message title', 
          //       body: 'body', 
          //       flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin
          //     );
          //   },
          //   child: const Text(
          //     'Send push notification',
          //     style: TextStyle(
          //       fontSize: 18,
          //     ),
          //   ),
          // )
        // ),
        ],
        ),
      ),
    );
  }
  // Widget build(BuildContext context) => Scaffold(
  //   body: Center(
  //     child: Column(
  //       children: <Widget>[
  //         const Padding(  
  //           padding: EdgeInsets.only(top: 105),
  //         ),
  //         ElevatedButton(
  //           style: ElevatedButton.styleFrom(
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(20),
  //             ),
  //             backgroundColor: Colors.red,
  //             foregroundColor: Colors.black,
  //           ),
  //           onPressed: () async {

  //           },
  //           child: const Text(
  //             'Send push notification'
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  // );
}