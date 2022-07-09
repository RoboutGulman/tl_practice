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
        LineTitleItem(lineView.title),
        SpaceLine(lineView.spaceBefore),
        for (int i = 0; i < lineView.dateList.length; i++)
          LineItem(lineView.dateList[i]),
        SpaceLine(lineView.spaceAfter),
      ],
    );
  }
}
