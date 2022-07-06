import 'package:flutter/material.dart';

import 'AddAndRemoveButtons.dart';
import 'dart:math';

import 'ListOfSquares.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const maxLength = 4;
  static const maxHeight = 5;
  final List<List<Color>> _list = [];
  int currentLength = 0;

  Color intToColor(int number) {
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

  List<Color> generateRandomList() {
    final rng = Random();
    List<Color> newList = [];
    for (int i = 0; i <= maxLength; i++) {
      newList.add(intToColor(rng.nextInt(10)));
    }
    return newList;
  }

  void add() {
    if (_list.length - 1 == maxHeight) {
      return;
    }
    setState(() {
      if (_list.isEmpty) {
        _list.add(generateRandomList());
        currentLength = 1;
      } else if (currentLength + 1 == maxLength) {
        _list.add(generateRandomList());
        currentLength = 0;
      } else {
        currentLength++;
      }
    });
  }

  void delete() {
    setState(() {
      if (_list.isNotEmpty) {
        if (currentLength == 0) {
          _list.removeAt(_list.length - 1);
          currentLength = maxLength - 1;
        } else {
          currentLength--;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        AddAndRemoveButtons(add, delete),
        ListOfSquares(_list, maxLength, currentLength)
      ]),
    );
  }
}
