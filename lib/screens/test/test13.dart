import 'package:flutter/material.dart';

class Test13Screen extends StatelessWidget {
  const Test13Screen({super.key});
  final String virtue = "Simple";
  final String virtueDefinition = "I strive to be intellectually deep and quick and articulate thoughts succinctly and clearly without over-complication";
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
