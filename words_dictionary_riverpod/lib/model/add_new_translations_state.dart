import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/language.dart';

class NewWordTranslations {
  NewWordTranslations(
    this.translations,
  );

  final Map<Language, String> translations;
}

class NewWordTranslationsNotifier extends StateNotifier<NewWordTranslations> {
  NewWordTranslationsNotifier(Map<Language, String> translations)
      : super(NewWordTranslations(translations));

  void changeTranslations(Language language, String value) {
    var currentTranslations = state.translations;
    currentTranslations[language] = value;
    state = NewWordTranslations(currentTranslations);
  }

  void clearTranslations() {
    state = NewWordTranslations({});
  }
}

final newWordTranslationProvider =
    StateNotifierProvider<NewWordTranslationsNotifier, NewWordTranslations>(
        (_) => NewWordTranslationsNotifier({}));
