import 'package:flutter/material.dart';

class Test5Screen extends StatelessWidget {
  const Test5Screen({super.key});
  final String virtue = "Test5";
  final String virtueDefinition = "This is a test page for test5";
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
