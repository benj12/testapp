import 'package:flutter/material.dart';

class Test9Screen extends StatelessWidget {
  const Test9Screen({super.key});
  final String virtue = "Test9";
  final String virtueDefinition = "This is a test page for test9";
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
