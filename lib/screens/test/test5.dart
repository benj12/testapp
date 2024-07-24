import 'package:flutter/material.dart';

class Test5Screen extends StatelessWidget {
  const Test5Screen({super.key});
  final String virtue = "Studious";
  final String virtueDefinition = "I make time each day to study fundamental physics and the truths that grow out of it so that my understanding of it will grow";
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
