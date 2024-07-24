import 'package:flutter/material.dart';

class Test2Screen extends StatelessWidget {
  const Test2Screen({super.key});
  final String title = "Inquisitive";
  final String virtueDefinition = "I love learning. I yearn to know the truth. I love the truth. I take an interest in the world, people and God";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          virtueDefinition,
          style: const TextStyle(color: Colors.black, fontSize: 20),
          textAlign: TextAlign.center,
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