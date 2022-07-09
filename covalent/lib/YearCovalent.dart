import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Line/Line.dart';
import 'Line/model/LineView.dart';
import 'StartLine.dart';

String _returnMonth(DateTime date) {
  return DateFormat.MMMM().format(date);
}

class YearCovalent extends StatelessWidget {
  const YearCovalent(this.year, {Key? key}) : super(key: key);

  final int year;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          StartLine(year),
          for (int i = 1; i <= 12; i++)
            Line(generateLineViewForMonth(
                _returnMonth(DateTime.utc(year, i, 1)),
                DateTime.utc(year, i, 1))),
        ],
      ),
    );
  }
}
