import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/language.dart';
import 'package:words_dictionary_riverpod/model/add_new_translations_state.dart';
import 'package:words_dictionary_riverpod/model/words_dictionary_state.dart';
import 'package:words_dictionary_riverpod/style.dart';
import 'package:words_dictionary_riverpod/words_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _WordLanguageDropdownField()),
              Expanded(child: _TranslationLanguageDropdownField()),
              Expanded(
                flex: 2,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const _AddWordButton(),
                      _PrintButton(),
                      _DeleteButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 56,
          ),
          const WordsList(),
        ],
      ),
    );
  }
}

class _DeleteButton extends ConsumerWidget {
  const _DeleteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordIds = ref.watch(wordsDictionaryProvider).selectedWordIds;
    final wordsLength = wordIds.length;
    final wordsLengthString = wordsLength == 0 ? '' : ' $wordsLength words';

    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: fontSize),
      ),
      onPressed: () {
        wordsLength == 0
            ? null
            : ref.read(wordsDictionaryProvider.notifier).removeSelectedWords();
      },
      child: Text('Delete$wordsLengthString'),
    );
  }
}

class _PrintButton extends ConsumerWidget {
  const _PrintButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordIds = ref.watch(wordsDictionaryProvider).selectedWordIds;
    final wordsLength = wordIds.length;
    final wordsLengthString = wordsLength == 0 ? '' : ' $wordsLength words';

    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: fontSize),
      ),
      onPressed: () {
        wordsLength == 0
            ? null
            : ref.read(wordsDictionaryProvider).printSelectedWords();
      },
      child: Text('Print$wordsLengthString'),
    );
  }
}

class _WordLanguageDropdownField extends ConsumerWidget {
  const _WordLanguageDropdownField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _LanguageDropdownField(
      value: ref.watch(currentLanguagesProvider).wordLanguage,
      onChanged: (Language value) =>
          ref.read(currentLanguagesProvider.notifier).setWordLanguage(value),
      label: 'Word language:',
    );
  }
}

class _TranslationLanguageDropdownField extends ConsumerWidget {
  const _TranslationLanguageDropdownField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _LanguageDropdownField(
      value: ref.watch(currentLanguagesProvider).translationLanguage,
      onChanged: (Language value) => ref
          .read(currentLanguagesProvider.notifier)
          .setTranslationLanguage(value),
      label: 'Word language:',
    );
  }
}

class _LanguageDropdownField extends StatelessWidget {
  const _LanguageDropdownField({
    required this.value,
    required this.onChanged,
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;
  final Language value;
  final ValueChanged<Language> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: fontSize),
        ),
        const SizedBox(width: 20),
        DropdownButton<Language>(
          value: value,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple, fontSize: fontSize),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (Language? newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
          items: Language.values
              .map((Language value) => DropdownMenuItem<Language>(
                    value: value,
                    child: Text(value.name),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _AddWordButton extends ConsumerWidget {
  const _AddWordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(newWordTranslationProvider);
    final newWordTranslations = ref.read(newWordTranslationProvider.notifier);
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
                        {newWordTranslations.changeTranslations(value, string)},
                    decoration: InputDecoration(
                      //border: OutlineInputBorder(),
                      labelText: value.name,
                    ),
                  ),
                )
                .toList(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => {
                Navigator.pop(context, 'Cancel'),
                newWordTranslations.clearTranslations()
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => {
                //сделать проверку на пустые формы
                ref
                    .read(wordsDictionaryProvider.notifier)
                    .addWord(model.translations),
                newWordTranslations.clearTranslations(),
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
