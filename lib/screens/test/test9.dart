import 'package:flutter/material.dart';

class Test9Screen extends StatelessWidget {
  const Test9Screen({super.key});
  final String virtue = "Faithful";
  final String virtueDefinition = "I follow through on my IAP commitments.";
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
