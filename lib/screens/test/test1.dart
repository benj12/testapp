import 'package:flutter/material.dart';

class Test1Screen extends StatefulWidget {
  const Test1Screen({super.key});

  @override
  Test1ScreenState createState() => Test1ScreenState();
}

class Test1ScreenState extends State<Test1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test 1 page'),
      ),
      body: const Center(
        child: Text(
          'Test 1 Page',
          style: TextStyle(color: Colors.black),
        ),
      ),
      // body: Center(
      // child: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // children: [
      //   const Padding(
      //     padding: EdgeInsets.only(bottom: 35),
      //   ),
      //   RichText(
      //     text: TextSpan(
      //       text: 'Test1Page',
      //       style: DefaultTextStyle.of(context).style,
      //     ),
      //   )
      //   ],
      // ),
      // ),
    );
  }
}

// class Test1Screen extends StatelessWidget {
//   const Test1Screen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: const Text('Test1'),
//     );
//   }
// }