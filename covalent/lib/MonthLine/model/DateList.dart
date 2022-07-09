import 'package:flutter/material.dart';

class Date {
  Date(this.number, this.color, this.borderColor);
  Color color;
  int number;
  Color borderColor;
}

List<Date> generateDateList(DateTime initialDate) {
  List<Date> dateList = [];
  var currDate = initialDate;
  int i = 0;
  while (currDate.month == initialDate.month) {
    i++;
    if (currDate.weekday == 6 || currDate.weekday == 7) {
      dateList.add(Date(i, Colors.pink, Colors.orange));
    } else {
      dateList.add(Date(i, Colors.yellow, Colors.orange));
    }
    currDate = currDate.add(const Duration(days: 1));
  }
  return dateList;
}