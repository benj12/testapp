import 'package:flutter/material.dart';

class Test7Screen extends StatelessWidget {
  const Test7Screen({super.key});
  final String virtue = "Steadfast";
  final String virtueDefinition = "I will persevere in my commitment to learn and live the truth, especially the fundamental truths on which all others depend, and to help others do the same knowing that God will assist me with His grace";
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
