import 'package:flutter/material.dart';

class TableItem {
  TableItem(this.content, this.color, this.borderColor);
  Color color;
  String content;
  Color borderColor;
}

List<TableItem> generateMonthTableItemListFromDate(DateTime initialDate) {
  List<TableItem> itemList = [];
  var currDate = initialDate;
  int i = 0;
  while (currDate.month == initialDate.month) {
    i++;
    if (currDate.weekday == 6 || currDate.weekday == 7) {
      itemList.add(TableItem('$i', Colors.pink, Colors.orange));
    } else {
      itemList.add(TableItem('$i', Colors.yellow, Colors.orange));
    }
    currDate = currDate.add(const Duration(days: 1));
  }
  return itemList;
}

const List<String> _weekDays = [
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat",
  "Sun"
];

List<String> _generateStartLineTitles() {
  List<String> startLine = [];
  for (int i = 0; i < 5; i++) {
    startLine += _weekDays;
  }
  startLine.add("Mon");
  startLine.add("Tue");
  return startLine;
}

List<TableItem> generateTableItemsForStartLine() {
  var titles = _generateStartLineTitles();
  List<TableItem> itemList = [];
  for (String title in titles) {
    itemList.add(TableItem(title, Colors.white, Colors.orange));
  }
  return itemList;
}
