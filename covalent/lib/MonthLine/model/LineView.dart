import 'DateList.dart';

class LineView {
  LineView(this.dateList, this.spaceBefore, this.spaceAfter);
  int spaceBefore;
  List<Date> dateList;
  int spaceAfter;
}

LineView generateLineView(DateTime initialDate) {
  var dateList = generateDateList(initialDate);
  var spaceBefore = initialDate.weekday - 1;
  var spaceAfter = 37 - dateList.length - spaceBefore;
  LineView result = LineView(dateList, spaceBefore, spaceAfter);
  return result;
}