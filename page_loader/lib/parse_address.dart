String parseAddresToName(String address) {
  String result = address.replaceAll(RegExp('[/.]'), '-');
  result = result.replaceAll(RegExp('https:'), '');
  final pos = result.lastIndexOf('?');
  result = (pos != -1) ? result.substring(0, pos) : result;
  while (result[0] == '-') {
    result = result.substring(1, result.length);
  }
  return result;
}

String replaceCharAt(String oldString, int index, String newChar) {
  return oldString.substring(0, index) +
      newChar +
      oldString.substring(index + 1);
}

String makeCorrectFileName(String src) {
  var fileName = parseAddresToName(src);
  final pos = fileName.lastIndexOf('-');
  fileName = replaceCharAt(fileName, pos, '.');
  return fileName;
}
