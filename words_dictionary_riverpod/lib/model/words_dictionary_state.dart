import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/language.dart';
import 'package:words_dictionary_riverpod/data/word.dart';
import 'package:words_dictionary_riverpod/data/words_service.dart';

@immutable
class CurrentLanguages {
  const CurrentLanguages(this.wordLanguage, this.translationLanguage);
  final Language wordLanguage;
  final Language translationLanguage;
}

class CurrentLanguagesNotifier extends StateNotifier<CurrentLanguages> {
  CurrentLanguagesNotifier(Language word, Language translation)
      : super(CurrentLanguages(word, translation));

  void setWordLanguage(Language newWord) {
    state = CurrentLanguages(newWord, state.translationLanguage);
  }

  void setTranslationLanguage(Language newTranslation) {
    state = CurrentLanguages(state.wordLanguage, newTranslation);
  }
}

final currentLanguagesProvider =
    StateNotifierProvider<CurrentLanguagesNotifier, CurrentLanguages>(
        (_) => CurrentLanguagesNotifier(Language.russian, Language.english));

@immutable
class WordsDictionary {
  const WordsDictionary(this.wordList, this.selectedWordIds);

  final List<Word> wordList;
  final Set<int> selectedWordIds;

  //передавать current languages аргументом
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

class WordsDictionaryNotifier extends StateNotifier<WordsDictionary> {
  WordsDictionaryNotifier(List<Word> wordList, Set<int> selectedWordIds)
      : super(WordsDictionary(wordList, selectedWordIds));

  void printSelectedWords(CurrentLanguages currentLanguages) {
    state.printSelectedWords(currentLanguages);
  }

  void addWord(Map<Language, String> translations) {
    var newWordList = state.wordList;
    final newWordtId = newWordList.length + 1;
    final newWord = Word(
        id: newWordtId, translations: Map<Language, String>.from(translations));
    newWordList.add(newWord);
    state = WordsDictionary(newWordList, state.selectedWordIds);
  }

  void removeSelectedWords() {
    var newWordList = state.wordList;
    newWordList
        .removeWhere((element) => state.selectedWordIds.contains(element.id));
    state = WordsDictionary(newWordList, {});
  }

  void selectWord(int wordId) {
    if (!state.selectedWordIds.contains(wordId)) {
      var newSelectedWordIds = state.selectedWordIds;
      newSelectedWordIds.add(wordId);
      state = WordsDictionary(state.wordList, newSelectedWordIds);
    }
  }

  void unselectWord(int wordId) {
    if (state.selectedWordIds.contains(wordId)) {
      var newSelectedWordIds = state.selectedWordIds;
      newSelectedWordIds.remove(wordId);
      state = WordsDictionary(state.wordList, newSelectedWordIds);
    }
  }
}

final wordsDictionaryProvider =
    StateNotifierProvider<WordsDictionaryNotifier, WordsDictionary>((ref) {
  return WordsDictionaryNotifier(getWords(), {});
});
