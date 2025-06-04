import 'package:flutter/material.dart';

class Test7Screen extends StatelessWidget {
  const Test7Screen({super.key});
  final String virtue = "Test7";
  final String virtueDefinition = "This is test7";
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
