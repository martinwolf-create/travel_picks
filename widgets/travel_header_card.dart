import 'package:flutter/material.dart';

class TravelHeaderCard extends StatelessWidget {
  const TravelHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.lightBlueAccent,
      child: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Text(
          "🌎 Willkommen zu deinen Reiseinspirationen",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}