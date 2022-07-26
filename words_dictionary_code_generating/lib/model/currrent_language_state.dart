import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/language.dart';

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