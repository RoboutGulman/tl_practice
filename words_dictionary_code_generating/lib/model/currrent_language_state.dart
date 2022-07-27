import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/language.dart';

part 'currrent_language_state.g.dart';
part 'currrent_language_state.freezed.dart';

@freezed
class CurrentLanguages with _$CurrentLanguages {
  const factory CurrentLanguages(
      {required Language wordLanguage,
      required Language translationLanguage}) = _CurrentLanguages;

  factory CurrentLanguages.fromJson(Map<String, Object?> json) =>
      _$CurrentLanguagesFromJson(json);
}

class CurrentLanguagesNotifier extends StateNotifier<CurrentLanguages> {
  CurrentLanguagesNotifier(Language word, Language translation)
      : super(CurrentLanguages(
            wordLanguage: word, translationLanguage: translation));

  void setWordLanguage(Language newWord) {
    state = state.copyWith(wordLanguage: newWord);
  }

  void setTranslationLanguage(Language newTranslation) {
    state = state.copyWith(translationLanguage: newTranslation);
  }
}

final currentLanguagesProvider =
    StateNotifierProvider<CurrentLanguagesNotifier, CurrentLanguages>(
        (_) => CurrentLanguagesNotifier(Language.russian, Language.english));
