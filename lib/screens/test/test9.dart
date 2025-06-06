import 'package:flutter/material.dart';

class Test9Screen extends StatelessWidget {
  const Test9Screen({super.key});
  final String virtue = "Test9";
  final String virtueDefinition = "This is test9";
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
