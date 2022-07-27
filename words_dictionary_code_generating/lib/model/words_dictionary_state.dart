import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/language.dart';
import '../data/word.dart';
import '../data/words_service.dart';
import 'currrent_language_state.dart';

part 'words_dictionary_state.freezed.dart';
part 'words_dictionary_state.g.dart';

@freezed
class WordsDictionary with _$WordsDictionary {
  const WordsDictionary._();
  @JsonSerializable(explicitToJson: true)
  const factory WordsDictionary(
      {required List<Word> wordList,
      required Set<int> selectedWordIds,
      required int maxId}) = _WordsDictionary;

  factory WordsDictionary.fromJson(Map<String, Object?> json) =>
      _$WordsDictionaryFromJson(json);

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
      : super(WordsDictionary(
            wordList: wordList,
            selectedWordIds: selectedWordIds,
            maxId: _maxIdInList(wordList)));

  void addWord(Map<Language, String> translations) {
    var newWordList = state.wordList.toList();
    final newWordId = state.maxId + 1;
    final newWord = Word(
        id: newWordId, translations: Map<Language, String>.from(translations));
    newWordList.add(newWord);
    state = state.copyWith(wordList: newWordList, maxId: newWordId);
  }

  void removeSelectedWords() {
    var newWordList = state.wordList.toList();
    newWordList
        .removeWhere((element) => state.selectedWordIds.contains(element.id));
    state = state.copyWith(wordList: newWordList, selectedWordIds: {});
  }

  void selectWord(int wordId) {
    if (!state.selectedWordIds.contains(wordId)) {
      var newSelectedWordIds = state.selectedWordIds.toSet();
      newSelectedWordIds.add(wordId);
      state = state.copyWith(selectedWordIds: newSelectedWordIds);
    }
  }

  void unselectWord(int wordId) {
    if (state.selectedWordIds.contains(wordId)) {
      var newSelectedWordIds = state.selectedWordIds.toSet();
      newSelectedWordIds.remove(wordId);
      state = state.copyWith(selectedWordIds: newSelectedWordIds);
    }
  }
}

final wordsDictionaryProvider =
    StateNotifierProvider<WordsDictionaryNotifier, WordsDictionary>((ref) {
  return WordsDictionaryNotifier(getWords(), {});
});
