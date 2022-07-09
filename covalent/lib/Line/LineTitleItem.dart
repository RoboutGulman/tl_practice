import 'package:flutter/material.dart';

class MonthNameItem extends StatelessWidget {
  const MonthNameItem(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 9),
          ),
        ),
      ),
    );
  }
}
