import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PowerLevelIndicator extends StatelessWidget {
  const PowerLevelIndicator(this.power, this.level, {super.key});

  final double level;
  final String power;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(power),
        Container(
            width: 200,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300], // Background color of the indicator
            ),
            child: FractionallySizedBox(
              alignment: Alignment.topLeft,
              widthFactor: level,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue, // Color representing the skill level
                ),
              ),
            )),
      ],
    );
  }
}
