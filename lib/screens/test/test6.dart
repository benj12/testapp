import 'package:flutter/material.dart';

class Test6Screen extends StatelessWidget {
  const Test6Screen({super.key});
  final String virtue = "Vigilant";
  final String virtueDefinition = "I am alert so that I will not miss out on opportunities to learn and grow, even when facing difficult circumstances, and to help others do the same.";
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
