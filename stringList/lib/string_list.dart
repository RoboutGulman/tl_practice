import 'dart:io';

class StringList {
  StringList();
  final List<String> _list = [];

  void add(String value) {
    _list.add(value);
  }

  void sort() {
    _list.sort();
  }

  void printAll() {
    if (_list.isEmpty) {
      stdout.writeln('list is empty');
      return;
    }
    for (int i = 0; i < _list.length; i++) {
      stdout.writeln('${i + 1}) ${_list[i]}');
    }
  }

  void delete(int index) {
    int actualIndex = index - 1;
    if (actualIndex < 0 || actualIndex >= _list.length) {
      stdout.writeln('wrong index');
      return;
    }
    _list.removeAt(actualIndex);
  }
}
