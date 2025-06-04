import 'package:flutter/material.dart';

class Test5Screen extends StatelessWidget {
  const Test5Screen({super.key});
  final String virtue = "Test5";
  final String virtueDefinition = "This is Test5";
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
