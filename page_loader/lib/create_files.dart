import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:page_loader/get_urls.dart';
import 'package:page_loader/parse_address.dart';

void makeIndexFile(String folderName, String address) async {
  final url = Uri.parse(address);
  final response = await http.Client().get(url);

  final indexFile = await File('$folderName/index.html').create();

  await indexFile.writeAsBytes(response.bodyBytes);
}

void makeFiles(String tag, String path, String address) async {
  var response = await http.Client().get(Uri.parse(address));
  var urls = getUrls(response.body, tag, address);

  for (var url in urls) {
    var fileName = makeCorrectFileName(url);

    final response = await http.Client().get(Uri.parse(url));
    final file = await File('$path$fileName').create();
    await file.writeAsBytes(response.bodyBytes);
  }
}

void createFolder(String path, String folderName) async {
  Directory root = Directory('$path$folderName');
  await root.create(recursive: false);
}
