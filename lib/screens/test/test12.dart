import 'package:flutter/material.dart';

class Test12Screen extends StatelessWidget {
  const Test12Screen({super.key});
  final String virtue = "Reverent";
  final String virtueDefinition = "I order all my actions towards growth toward the Unchangeable Changer and accept all He offers me";
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
