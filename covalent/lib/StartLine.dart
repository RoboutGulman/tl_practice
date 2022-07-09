import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

const List<String> _weekDays = [
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat",
  "Sun"
];

class StartLine extends StatelessWidget {
  const StartLine(this.year, {Key? key}) : super(key: key);
  final int year;

  @override
  Widget build(BuildContext context) {
    List<String> startLine = [];
    for (int i = 0; i < 5; i++) {
      startLine += _weekDays;
    }
    startLine.add("Mon");
    startLine.add("Tue");
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
              ),
              child: Center(
                child: Text(
                  '$year',
                  style: const TextStyle(fontSize: 9),
                ),
              )),
        ),
        for (int i = 0; i < 37; i++)
          Expanded(
            flex: 1,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
              ),
              child: Center(
                child: Text(startLine[i]),
              ),
            ),
          )
      ],
    );
  }
}
