import 'package:flutter/material.dart';

import '../presentation/GenerateRandomColorsList.dart';
import 'ButtonBar.dart';

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

  void add() {
    if (_list.length - 1 == maxHeight) {
      return;
    }
    setState(() {
      if (_list.isEmpty) {
        _list.add(generateRandomList(maxLength));
        currentLength = 1;
      } else if (currentLength + 1 == maxLength) {
        _list.add(generateRandomList(maxLength));
        currentLength = 0;
      } else {
        currentLength++;
      }
    });
  }

  void delete() {
    if (_list.isEmpty) {
      return;
    }
    setState(() {
      if (currentLength == 0) {
        _list.removeAt(_list.length - 1);
        currentLength = maxLength - 1;
      } else {
        currentLength--;
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
