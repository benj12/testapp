import 'package:flutter/material.dart';

class Test2Screen extends StatelessWidget {
  const Test2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test 2 page'),
      ),
      body: const Center(
        child: Text(
          'Test 2 Page',
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