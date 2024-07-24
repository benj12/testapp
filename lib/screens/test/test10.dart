import 'package:flutter/material.dart';

class Test10Screen extends StatelessWidget {
  const Test10Screen({super.key});
  final String virtue = "Test10";
  final String virtueDefinition = "This is test10";
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
