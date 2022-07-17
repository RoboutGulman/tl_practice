import 'package:flutter/material.dart';

import 'data/language.dart';
import 'data/word.dart';
import 'data/words_service.dart';
import 'language_filters_provider.dart';

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
  void didChangeDependencies() {
    final filters = LanguageFiltersInheritedNotifier.of(context);
    filters.addListener(() {
      model.wordLanguage = filters.wordLanguage;
      model.translationLanguage = filters.translationLanguage;
    });
    super.didChangeDependencies();
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

  final _selectedWordIds = <int>{};
  Set<int> get selectedWordIds => _selectedWordIds;

  var wordLanguage = Language.russian;
  var translationLanguage = Language.english;

  void addWord(Map<Language, String> translations) {
    final newWordtId = _wordList.length + 1;
    final newWord = Word(id: newWordtId, translations: translations);
    _wordList.add(newWord);
    notifyListeners();
  }

  void removeSelectedWords() {
    _wordList.removeWhere((element) => _selectedWordIds.contains(element.id));
    _selectedWordIds.clear();
    notifyListeners();
  }

  void printSelectedWords() {
    final result = _wordList
        .where((word) => _selectedWordIds.contains(word.id))
        .map((word) {
      final translations = word.translations;

      return '${translations[wordLanguage]} - ${translations[translationLanguage]}';
    }).join("\n\r");

    // ignore: avoid_print
    print(result);
  }

  void selectWord(int wordId) {
    if (!_selectedWordIds.contains(wordId)) {
      _selectedWordIds.add(wordId);
      notifyListeners();
    }
  }

  void unselectWord(int wordId) {
    if (_selectedWordIds.contains(wordId)) {
      _selectedWordIds.remove(wordId);
      notifyListeners();
    }
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
