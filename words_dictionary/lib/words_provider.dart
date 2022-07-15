import 'package:flutter/material.dart';

import 'data/language.dart';
import 'data/word.dart';
import 'data/words_service.dart';

class WordsProvider extends StatefulWidget {
  const WordsProvider({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<WordsProvider> createState() => _WordsProviderState();
}

class _WordsProviderState extends State<WordsProvider> {
  final model = WordsModel();

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => WordsInheritedNotifier(
        notifier: model,
        child: widget.child,
      );
}

class WordsModel extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Word> _wordList = getWords();

  List<Word> get wordList => _wordList;

  void addWord(Map<Language, String> translations) {
    final newElementId = _wordList.length + 1;
    final newWord = Word(id: newElementId, translations: translations);
    _wordList.add(newWord);
    notifyListeners();
  }

  void removeWordById(int id) {
    _wordList.removeAt(id - 1);
    notifyListeners();
  }
}

class WordsInheritedNotifier extends InheritedNotifier<WordsModel> {
  const WordsInheritedNotifier({
    Key? key,
    required WordsModel notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static WordsModel of(BuildContext context) {
    final WordsInheritedNotifier? result =
        context.dependOnInheritedWidgetOfExactType<WordsInheritedNotifier>();
    if (result == null) {
      throw Exception('No WordsInheritedNotifier found in context');
    }

    final model = result.notifier;
    if (model == null) {
      throw Exception('WordsModel is null');
    }

    return model;
  }
}
