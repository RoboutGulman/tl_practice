import 'package:page_loader/create_files.dart';
import 'package:page_loader/parse_address.dart';

void main(List<String> arguments) async {
  var address = "https://www.travelline.ru";
  var siteName = parseAddresToName(address);
  await createFolder('', siteName);
  await makeIndexFile(siteName, address);
  await createFolder('$siteName/', '${siteName}_files');
  await makeFiles('script[src]', '$siteName/${siteName}_files/', address);
  await makeFiles('link[href]', '$siteName/${siteName}_files/', address);
}
