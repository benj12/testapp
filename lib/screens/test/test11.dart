import 'package:flutter/material.dart';

class Test11Screen extends StatelessWidget {
  const Test11Screen({super.key});
  final String virtue = "Grateful";
  final String virtueDefinition = "I will not lose hope in God or the tasks He has given me, but be thankful for all He has given me in my very existence and all the truth He gives me each day, especially through my work with IAP.";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(virtue),
      ),
      body: Center(
        child: Text(
          virtueDefinition,
          style: const TextStyle(color: Colors.black, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
