import 'package:flutter/material.dart';

class Test13Screen extends StatelessWidget {
  const Test13Screen({super.key});
  final String virtue = "Test13";
  final String virtueDefinition = "This is a test page for Test13";
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
