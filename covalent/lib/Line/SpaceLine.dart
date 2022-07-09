import 'package:flutter/material.dart';

class SpaceLine extends StatelessWidget {
  const SpaceLine(this.length, {Key? key}) : super(key: key);

  final int length;
  
  @override
  Widget build(BuildContext context) {
    return length != 0
        ? Expanded(
            flex: length,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              height: 50,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 202, 200, 200),
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, 139, 141, 146)))),
            ))
        : Container();
  }
}
