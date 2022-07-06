import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListOfSquares extends StatelessWidget {
  const ListOfSquares(this._list, this.maxLenght, this.currentLength,
      {Key? key})
      : super(key: key);
  final List<List<Color>> _list;
  final int maxLenght;
  final int currentLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int j = 0; j < _list.length; j++)
          Row(children: [
            for (int i = 0;
                i < (j == _list.length - 1 ? currentLength : maxLenght);
                i++)
              Container(
                  width: MediaQuery.of(context).size.width / maxLenght - 40.0,
                  margin: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                  padding: const EdgeInsets.all(10.0),
                  color: _list[j][i],
                  child: Text(
                    '${j + 1} - ${i + 1} ',
                    textAlign: TextAlign.center,
                  ))
          ]),
      ],
    );
  }
}
