import 'package:covalent/MonthLine/DayOfMonthItem.dart';
import 'package:covalent/MonthLine/GreyLine.dart';
import 'package:flutter/material.dart';

import 'model/LineView.dart';
import 'MonthNameItem.dart';

class MonthLine extends StatelessWidget {
  const MonthLine(this.startDate, {Key? key}) : super(key: key);
  final DateTime startDate;

  @override
  Widget build(BuildContext context) {
    final lineView = generateLineView(startDate);
    return Row(
      children: [
        MonthNameItem(startDate),
        GreyLine(lineView.spaceBefore),
        for (int i = 0; i < lineView.dateList.length; i++)
          DayOfMonthItem(lineView.dateList[i]),
        GreyLine(lineView.spaceAfter),
      ],
    );
  }
}
