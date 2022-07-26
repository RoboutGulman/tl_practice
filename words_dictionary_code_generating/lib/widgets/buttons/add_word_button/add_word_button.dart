import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_code_generating/data/language.dart';
import 'package:words_dictionary_code_generating/model/words_dictionary_state.dart';
import 'package:words_dictionary_code_generating/widgets/style.dart';

import 'add_word_dialog.dart';

part 'add_word_button.g.dart';

@hcwidget
Widget addWordButton(BuildContext context, WidgetRef ref) {
  final translations = useState<Map<Language, String>>({});

  void changeTranslations(Language language, String value) {
    translations.value[language] = value;
  }

  void clearTranslations() {
    translations.value.clear();
  }

//сделать проверку на пустые формы
  void addWordToDictionary() {
    ref.read(wordsDictionaryProvider.notifier).addWord(translations.value);
  }

  return TextButton(
    onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AddWordDialog(
              changeTranslations: changeTranslations,
              clearTranslations: clearTranslations,
              addWordToDictionary: addWordToDictionary,
            )),
    child: const Text(
      'Add new Word',
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.normal),
    ),
  );
}
