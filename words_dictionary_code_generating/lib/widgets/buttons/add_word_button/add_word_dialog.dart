import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_code_generating/data/language.dart';
import 'package:words_dictionary_code_generating/model/words_dictionary_state.dart';

import 'new_word_translation_fields.dart';

part 'add_word_dialog.g.dart';

@hcwidget
Widget addWordDialog(BuildContext context, WidgetRef ref) {
  final translations = useState<Map<Language, String>>({});

  void changeTranslations(Language language, String value) {
    translations.value[language] = value;
  }

  void clearTranslations() {
    translations.value.clear();
  }

//сделать проверку на пустые формы
  bool addWordToDictionary() {
    for (var language in Language.values) {
      if (!translations.value.containsKey(language)) {
        return false;
      }
    }
    ref.read(wordsDictionaryProvider.notifier).addWord(translations.value);
    return true;
  }

  return AlertDialog(
    title: const Text('Type word in all of languages'),
    content: NewWordTranslationFields(changeTranslations: changeTranslations),
    actions: <Widget>[
      TextButton(
        onPressed: () =>
            {Navigator.pop(context, 'Cancel'), clearTranslations()},
        child: const Text('Cancel'),
      ),
      TextButton(
        onPressed: () => {
          if (addWordToDictionary())
            {
              clearTranslations(),
              Navigator.pop(context, 'OK'),
            },
        },
        child: const Text('OK'),
      ),
    ],
  );
}
