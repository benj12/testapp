import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        children: <Widget>[
          const Padding(  
            padding: EdgeInsets.only(top: 105),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.red,
              foregroundColor: Colors.black,
            ),
            onPressed: () {

            },
            child: const Text(
              'Send push notification'
            ),
          ),
        ],
      ),
    ),
  );
}