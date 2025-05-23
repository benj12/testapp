import 'package:flutter/material.dart';

class Test4Screen extends StatelessWidget {
  // const Test4Screen({super.key});
  final String payload = "/test4";
  const Test4Screen({super.key, payload});
  final String virtue = "Test4";
  final String virtueDefinition = "This is Test4";

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