import 'package:flutter/material.dart';

class Test4Screen extends StatelessWidget {
  const Test4Screen({super.key});
  final String virtue = "Integrated";
  final String virtueDefinition = "I am committed to thinking and acting based on grounded principle";
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