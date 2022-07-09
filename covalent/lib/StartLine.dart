import 'package:flutter/material.dart';

import 'Line/Line.dart';
import 'Line/model/LineView.dart';

class StartLine extends StatelessWidget {
  const StartLine(this.year, {Key? key}) : super(key: key);
  final int year;

  @override
  Widget build(BuildContext context) {
    var startLine = generateLineViewForStartLine(year);
    return Line(startLine);
  }
}
