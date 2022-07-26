import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/language.dart';
import 'package:words_dictionary_riverpod/model/words_dictionary_state.dart';
import 'package:words_dictionary_riverpod/widgets/buttons/add_word_button/add_word_dialog.dart';
import 'package:words_dictionary_riverpod/widgets/style.dart';

class AddWordButton extends ConsumerStatefulWidget {
  const AddWordButton({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddWordButtonState();
}

class _AddWordButtonState extends ConsumerState<AddWordButton> {
  Map<Language, String> translations = {};

  void changeTranslations(Language language, String value) {
    translations[language] = value;
  }

  void clearTranslations() {
    translations.clear();
  }

//сделать проверку на пустые формы
  void addWordToDictionary() {
    ref.read(wordsDictionaryProvider.notifier).addWord(translations);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AddWordDialog(
              changeTranslations, clearTranslations, addWordToDictionary)),
      child: const Text(
        'Add new Word',
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.normal),
      ),
    );
  }
}
