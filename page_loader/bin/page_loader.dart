import 'package:page_loader/create_files.dart';
import 'package:page_loader/parse_address.dart';

void main(List<String> arguments) async {
  final address = "https://www.travelline.ru";//"https://yaktribe.games/underhive/gang/4215.298790/";//arguments[0];//"https://www.travelline.ru";
  final siteName = parseAddresToName(address);
  await createFolder('', siteName);
  await makeIndexFile(siteName, address);
  await createFolder('$siteName/', '${siteName}_files');
  await makeFiles('script[src]', '$siteName/${siteName}_files/', address);
  await makeFiles('link[href]', '$siteName/${siteName}_files/', address);
}
