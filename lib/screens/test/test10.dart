import 'package:flutter/material.dart';

class Test10Screen extends StatelessWidget {
  const Test10Screen({super.key});
  final String virtue = "Compassionate";
  final String virtueDefinition = "I go out of my way to understand my fellowman's plight, and do all that I can to help him grow in truth";
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
