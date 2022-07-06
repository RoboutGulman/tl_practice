import 'package:flutter/material.dart';

class AddAndRemoveButtons extends StatelessWidget {
  const AddAndRemoveButtons(this.add, this.remove, {Key? key})
      : super(key: key);
  final VoidCallback add;
  final VoidCallback remove;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            child: TextButton(
                onPressed: add,
                child: const Text('add',
                    style: TextStyle(color: Colors.deepPurple))),
          ),
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            child: TextButton(
                onPressed: remove,
                child: const Text('remove',
                    style: TextStyle(color: Colors.deepPurple))),
          ),
        ],
      ),
    );
  }
}
