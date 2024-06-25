import 'package:flutter/material.dart';

class ToggleScheduleButton extends StatefulWidget {
  const ToggleScheduleButton({super.key});

  @override
  ToggleScheduleButtonState createState() =>  ToggleScheduleButtonState();
}

class ToggleScheduleButtonState extends State<ToggleScheduleButton> {
  List<bool> isSelected = [true, false];
  
  @override
  Widget build(BuildContext context) => ToggleButtons(
    isSelected: isSelected,
    children: const <Widget>[
      Text("Schedule notifications", style: TextStyle(fontSize: 18)),
    ],
    
  );
}