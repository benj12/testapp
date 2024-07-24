import 'package:flutter/material.dart';

class Test1Screen extends StatefulWidget {
  const Test1Screen({super.key});

  @override
  Test1ScreenState createState() => Test1ScreenState();
}


class Test1ScreenState extends State<Test1Screen> {
  final String title = "Humble";
  final String virtueDefinition = "I am open to all truth, even if it is in the form of a correction";
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

// class Test1Screen extends StatelessWidget {
//   const Test1Screen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: const Text('Test1'),
//     );
//   }
// }