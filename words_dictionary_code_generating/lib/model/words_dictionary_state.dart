import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/language.dart';
import '../data/word.dart';
import '../data/words_service.dart';
import 'currrent_language_state.dart';

@immutable
class WordsDictionary {
  const WordsDictionary(this.wordList, this.selectedWordIds, this.maxId);

  final List<Word> wordList;
  final Set<int> selectedWordIds;
  final int maxId;

  void printSelectedWords(CurrentLanguages currentLanguages) {
    final result =
        wordList.where((word) => selectedWordIds.contains(word.id)).map((word) {
      final translations = word.translations;

      return '${translations[currentLanguages.wordLanguage]} - ${translations[currentLanguages.translationLanguage]}';
    }).join("\n\r");

    // ignore: avoid_print
    print(result);
  }
}

int _maxIdInList(List<Word> wordList) {
  var maxId = 0;
  for (var element in wordList) {
    if (element.id > maxId) {
      maxId = element.id;
    }
  }
  return maxId;
}

class WordsDictionaryNotifier extends StateNotifier<WordsDictionary> {
  WordsDictionaryNotifier(List<Word> wordList, Set<int> selectedWordIds)
      : super(
            WordsDictionary(wordList, selectedWordIds, _maxIdInList(wordList)));

  void addWord(Map<Language, String> translations) {
    var newWordList = state.wordList.toList();
    final newWordtId = state.maxId + 1;
    final newWord = Word(
        id: newWordtId, translations: Map<Language, String>.from(translations));
    newWordList.add(newWord);
    state = WordsDictionary(newWordList, state.selectedWordIds, newWordtId);
  }

  void removeSelectedWords() {
    var newWordList = state.wordList.toList();
    newWordList
        .removeWhere((element) => state.selectedWordIds.contains(element.id));
    state = WordsDictionary(newWordList, {}, state.maxId);
  }

  void selectWord(int wordId) {
    if (!state.selectedWordIds.contains(wordId)) {
      var newSelectedWordIds = state.selectedWordIds.toSet();
      newSelectedWordIds.add(wordId);
      state = WordsDictionary(state.wordList, newSelectedWordIds, state.maxId);
    }
  }

  void unselectWord(int wordId) {
    if (state.selectedWordIds.contains(wordId)) {
      var newSelectedWordIds = state.selectedWordIds.toSet();
      newSelectedWordIds.remove(wordId);
      state = WordsDictionary(state.wordList, newSelectedWordIds, state.maxId);
    }
  }
}

final wordsDictionaryProvider =
    StateNotifierProvider<WordsDictionaryNotifier, WordsDictionary>((ref) {
  return WordsDictionaryNotifier(getWords(), {});
});
