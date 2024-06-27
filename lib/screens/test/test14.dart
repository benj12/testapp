import 'package:flutter/material.dart';

class Test14Screen extends StatelessWidget {
  const Test14Screen({super.key});
  final String virtue = "Test14";
  final String virtueDefinition = "This is a test page for Test14";
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
