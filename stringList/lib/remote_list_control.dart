import 'dart:io';

import 'string_list.dart';

class RemoteControl {
  static final StringList _myList = StringList();

  final Map<String, Function> _commands = {
    "sort": _sort,
    "add": _add,
    "show": _show,
    "delete": _delete,
    "help": _help
  };

  void handleCommands() {
    bool correctEnter;
    while (true) {
      correctEnter = false;

      stdout.write('Enter command or "help": ');
      final command = stdin.readLineSync() ?? ''; //??-проверка на null

      for (var item in _commands.entries) {
        if (item.key == command) {
          correctEnter = true;
          item.value();
        }
      }

      if (command == "exit") {
        break;
      }
      if (!correctEnter) {
        stdout.writeln('Incorrect command syntax');
      }
    }
  }

  static void _add() {
    stdout.write('Enter new item: ');

    final item = stdin.readLineSync() ?? ''; //??-проверка на null

    if (item == '') {
      stdout.writeln('The item cannot be empty');
      return;
    }

    _myList.add(item);
  }

  static void _sort() {
    _myList.sort();
  }

  static void _show() {
    _myList.printAll();
  }

  static void _delete() {
    stdout.write('Enter index of item to delete: ');

    final index = stdin.readLineSync() ?? ''; //??-проверка на null

    _myList.delete(int.parse(index));
  }

  static void _help() {
    stdout.write(
        'availible commands:\n"add" to add new item\n"show" to print all items\n"exit" to exit\n"delete" to delete item\n"sort" to sort the list\n');
  }
}
