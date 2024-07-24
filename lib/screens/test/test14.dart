import 'package:flutter/material.dart';

class Test14Screen extends StatelessWidget {
  const Test14Screen({super.key});
  final String virtue = "Strives for Excellence";
  final String virtueDefinition = "I strive to learn completely everything that is in front of me to learn, purging any errors or even imperfections in the essence of my learning";
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
