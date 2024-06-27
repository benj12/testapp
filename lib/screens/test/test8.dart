import 'package:flutter/material.dart';

class Test8Screen extends StatelessWidget {
  const Test8Screen({super.key});
  final String virtue = "Test8";
  final String virtueDefinition = "This is a test page for test8";
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

