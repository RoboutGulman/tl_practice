import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'MonthLine.dart';
import 'StartLine.dart';

class YearCovalent extends StatelessWidget {
  const YearCovalent(this.year, {Key? key}) : super(key: key);
  final int year;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          StartLine(year),
          for (int i = 1; i <= 12; i++) MonthLine(DateTime.utc(year, i, 1)),
        ],
      ),
    );
  }
}
