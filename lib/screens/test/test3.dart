import 'package:flutter/material.dart';

class Test3Screen extends StatelessWidget {
  const Test3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test 3 page'),
      ),
      body: const Center(
        child: Text(
          'Test 3 Page',
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