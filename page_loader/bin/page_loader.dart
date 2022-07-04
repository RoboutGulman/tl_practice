import 'package:page_loader/create_files.dart';
import 'package:page_loader/parse_address.dart';

void main(List<String> arguments) async {
  var address = "https://www.travelline.ru";
  var siteName = parseAddresToName(address);
  createFolder('', siteName);
  makeIndexFile(siteName, address);
  createFolder('$siteName/', '${siteName}_files');
  makeFiles('script[src]', '$siteName/${siteName}_files/', address);
  makeFiles('link[href]', '$siteName/${siteName}_files/', address);
}
