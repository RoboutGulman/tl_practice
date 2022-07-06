import 'dart:math';

import 'package:flutter/material.dart';

Color _intToColor(int number) {
  switch (number) {
    case 0:
      return Colors.black;
    case 1:
      return Colors.white;
    case 2:
      return Colors.green;
    case 3:
      return Colors.yellow;
    case 4:
      return Colors.red;
    case 5:
      return Colors.blue;
    case 6:
      return Colors.deepPurple;
    case 7:
      return Colors.deepOrange;
    case 8:
      return const Color.fromARGB(255, 202, 28, 211);
    case 9:
      return const Color.fromARGB(255, 90, 146, 214);
    default:
      return Colors.black;
  }
}

List<Color> generateRandomList(int maxLength) {
  final rng = Random();
  List<Color> newList = [];
  for (int i = 0; i <= maxLength; i++) {
    newList.add(_intToColor(rng.nextInt(10)));
  }
  return newList;
}
