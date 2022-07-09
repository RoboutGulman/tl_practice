import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class Date {
  Date(this.number, this.color, this.borderColor);
  Color color;
  int number;
  Color borderColor;
}

List<Date> generateDateList(DateTime initialDate) {
  List<Date> result = [];
  for (int i = 1; i < initialDate.weekday; i++) {
    result.add(Date(0, Colors.grey, Colors.grey));
  }
  var currDate = initialDate;
  int i = 0;
  while (currDate.month == initialDate.month) {
    i++;
    if (currDate.weekday == 6 || currDate.weekday == 7) {
      result.add(Date(i, Colors.pink, Colors.orange));
    } else {
      result.add(Date(i, Colors.yellow, Colors.orange));
    }
    currDate = currDate.add(const Duration(days: 1));
  }
  while (result.length < 37) {
    result.add(Date(0, Colors.grey, Colors.grey));
  }
  return result;
}

class MonthLine extends StatelessWidget {
  const MonthLine(this.startDate, {Key? key}) : super(key: key);
  final DateTime startDate;

  String returnMonth(DateTime date) {
    return DateFormat.MMMM().format(date);
  }

  @override
  Widget build(BuildContext context) {
    final list = generateDateList(startDate);
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
              ),
              child: Center(
                child: Text(
                  returnMonth(startDate),
                  style: const TextStyle(fontSize: 9),
                ),
              )),
        ),
        for (int i = 0; i < list.length; i++)
          Expanded(
            flex: 1,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: list[i].color,
                border: Border.all(color: list[i].borderColor),
              ),
              child: Center(
                child:
                    Text(list[i].number != 0 ? " ${list[i].number} " : "   "),
              ),
            ),
          )
      ],
    );
  }
}
