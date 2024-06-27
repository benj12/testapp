import 'package:flutter/material.dart';

class Test7Screen extends StatelessWidget {
  const Test7Screen({super.key});
  final String virtue = "Test7";
  final String virtueDefinition = "This is a test page for test7";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(virtue),
      ),
      body: Center(
        child: Text(
          virtueDefinition,
          style: const TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
