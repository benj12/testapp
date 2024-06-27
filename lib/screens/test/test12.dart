import 'package:flutter/material.dart';

class Test12Screen extends StatelessWidget {
  const Test12Screen({super.key});
  final String virtue = "Test12";
  final String virtueDefinition = "This is a test page for Test12";
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
