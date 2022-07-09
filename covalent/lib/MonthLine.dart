import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Line/Line.dart';
import 'Line/model/LineView.dart';

String _returnMonth(DateTime date) {
  return DateFormat.MMMM().format(date);
}

class MonthLine extends StatelessWidget {
  const MonthLine(this.year, this.monthIndex, {Key? key}) : super(key: key);

  final int year;
  final int monthIndex;

  @override
  Widget build(BuildContext context) {
    var startDate = DateTime.utc(year, monthIndex, 1);

    return Line(generateLineViewForMonth(_returnMonth(startDate), startDate));
  }
}
