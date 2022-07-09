import 'DateList.dart';

class LineView {
  LineView(this.title, this.dateList, this.spaceBefore, this.spaceAfter);
  String title;
  int spaceBefore;
  List<TableItem> dateList;
  int spaceAfter;
}

LineView generateLineViewForMonth(String title, DateTime initialDate) {
  var itemList = generateMonthTableItemListFromDate(initialDate);
  var spaceBefore = initialDate.weekday - 1;
  var spaceAfter = 37 - itemList.length - spaceBefore;
  LineView result = LineView(title, itemList, spaceBefore, spaceAfter);
  return result;
}

LineView generateLineViewForStartLine(int year){
   var itemList = generateTableItemsForStartLine();
   LineView result = LineView('$year', itemList, 0, 0);
   return result;
}