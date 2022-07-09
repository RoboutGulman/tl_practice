import 'package:flutter/material.dart';

import 'MonthLine.dart';
import 'StartLine.dart';

class OneYearCovalent extends StatelessWidget {
  const OneYearCovalent(this.year, {Key? key}) : super(key: key);

  final int year;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          StartLine(year),
          for (int i = 1; i <= 12; i++) MonthLine(year, i),
        ],
      ),
    );
  }
}
