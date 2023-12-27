import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icon_swither/widgets/marvel_text.dart';
import 'package:string_extensions/string_extensions.dart';

class PowerLevelIndicator extends StatelessWidget {
  const PowerLevelIndicator(this.power, this.level, {super.key});

  final double level;
  final String power;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MarvelTextWidget(10,power.capitalize!),
        MarvelTextWidget(10, (level*100).toInt().toString()),
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
