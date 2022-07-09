import 'package:flutter/material.dart';

import 'OneYearCovalent.dart';

class InfiniteCovalent extends StatelessWidget {
  const InfiniteCovalent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext buildContext, int index) {
      return OneYearCovalent(2022 + index);
    });
  }
}
