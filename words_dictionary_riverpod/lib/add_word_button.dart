import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/language.dart';
import 'package:words_dictionary_riverpod/model/words_dictionary_state.dart';
import 'package:words_dictionary_riverpod/style.dart';

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

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Type word in all of languages'),
          content: Column(
            children: Language.values
                .map(
                  (Language value) => TextField(
                    onChanged: (String string) =>
                        {changeTranslations(value, string)},
                    decoration: InputDecoration(
                      labelText: value.name,
                    ),
                  ),
                )
                .toList(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () =>
                  {Navigator.pop(context, 'Cancel'), clearTranslations()},
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => {
                //сделать проверку на пустые формы
                ref
                    .read(wordsDictionaryProvider.notifier)
                    .addWord(translations),
                clearTranslations(),
                Navigator.pop(context, 'OK'),
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text(
        'Add new Word',
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.normal),
      ),
    );
  }
}
