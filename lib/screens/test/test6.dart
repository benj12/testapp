import 'package:flutter/material.dart';

class Test6Screen extends StatelessWidget {
  const Test6Screen({super.key});
  final String virtue = "Test6";
  final String virtueDefinition = "This is a test page for test6";
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
