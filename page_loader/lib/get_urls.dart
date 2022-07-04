import 'package:html/parser.dart';
import 'package:html/dom.dart';

List<String> getUrls(String responseBody, String tag, String address) {
  List<String> result = [];
  var document = parse(responseBody);
  List<Element> links = document.querySelectorAll(tag);
  RegExp exp = RegExp(r'\[(\w+)\]');
  RegExpMatch? match = exp.firstMatch(tag);

  for (var link in links) {
    String src = link.attributes[match![1]] ?? '';
    if (src[0] == '/') {
      src = '$address$src';
    }
    result.add(src);
  }
  return result;
}
