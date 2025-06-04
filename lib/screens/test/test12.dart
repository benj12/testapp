import 'package:flutter/material.dart';

class Test12Screen extends StatelessWidget {
  const Test12Screen({super.key});
  final String virtue = "Test12";
  final String virtueDefinition = "This is test12";
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
