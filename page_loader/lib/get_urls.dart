import 'package:html/parser.dart';

List<String> getUrls(String responseBody, String tag, String address) {
  List<String> result = [];
  final document = parse(responseBody);
  final links = document.querySelectorAll(tag);
  RegExp exp = RegExp(r'\[(\w+)\]');
  RegExpMatch? match = exp.firstMatch(tag);

  for (var link in links) {
    var src = link.attributes[match![1]] ?? '';
    if (src[0] == '/') {
      src = '$address$src';
    } else
    if (src[0] != 'h') {
      src = '$address/$src';
    }
    result.add(src);
  }
  return result;
}
