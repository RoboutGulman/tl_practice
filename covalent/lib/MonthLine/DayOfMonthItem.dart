import 'package:flutter/cupertino.dart';

import 'model/DateList.dart';

class DayOfMonthItem extends StatelessWidget {
  const DayOfMonthItem(this.date, {Key? key}) : super(key: key);

  final Date date;
  
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
          child: Text("${date.number}"),
        ),
      ),
    );
  }
}
