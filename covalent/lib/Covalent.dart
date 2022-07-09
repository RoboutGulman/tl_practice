import 'package:flutter/cupertino.dart';

import 'YearCovalent.dart';

class Covalent extends StatelessWidget {
  const Covalent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext buildContext, int index) {
      return YearCovalent(2022 + index);
    });
  }
}
