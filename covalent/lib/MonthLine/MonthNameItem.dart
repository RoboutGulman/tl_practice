import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String _returnMonth(DateTime date) {
  return DateFormat.MMMM().format(date);
}

class MonthNameItem extends StatelessWidget {
  const MonthNameItem(this.startDate, {Key? key}) : super(key: key);
  final DateTime startDate;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
          ),
          child: Center(
            child: Text(
              _returnMonth(startDate),
              style: const TextStyle(fontSize: 9),
            ),
          )),
    );
  }
}
