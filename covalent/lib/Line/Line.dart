import 'package:flutter/material.dart';

import 'SpaceLine.dart';
import 'LineItem.dart';
import 'model/LineView.dart';
import 'LineTitleItem.dart';

class Line extends StatelessWidget {
  const Line(this.lineView, {Key? key}) : super(key: key);
  final LineView lineView;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MonthNameItem(lineView.title),
        GreyLine(lineView.spaceBefore),
        for (int i = 0; i < lineView.dateList.length; i++)
          DayOfMonthItem(lineView.dateList[i]),
        GreyLine(lineView.spaceAfter),
      ],
    );
  }
}
