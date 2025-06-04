import 'package:flutter/material.dart';

class Test13Screen extends StatelessWidget {
  const Test13Screen({super.key});
  final String virtue = "Test13";
  final String virtueDefinition = "This is test13";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(virtue),
      ),
      body: Center(
        child: Text(
          virtueDefinition,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontSize: 20
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
