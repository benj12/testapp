import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:testapp/services/local_notification_service.dart';

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
        child: SizedBox(
          width: 180,
          height: 50,
          child: ElevatedButton(
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
          )
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