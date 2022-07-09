import 'package:flutter/material.dart';

import 'model/DateList.dart';

class LineItem extends StatelessWidget {
  const LineItem(this.date, {Key? key}) : super(key: key);

  final TableItem date;
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: date.color,
          border: Border.all(color: date.borderColor),
        ),
        child: Center(
          child: Text(date.content),
        ),
      ),
    );
  }
}
