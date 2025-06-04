import 'package:flutter/material.dart';

class Test11Screen extends StatelessWidget {
  const Test11Screen({super.key});
  final String virtue = "Test11";
  final String virtueDefinition = "This is test11";


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
