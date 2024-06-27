import 'package:flutter/material.dart';

class Test10Screen extends StatelessWidget {
  const Test10Screen({super.key});
  final String virtue = "Test10";
  final String virtueDefinition = "This is a test page for Test10";
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
