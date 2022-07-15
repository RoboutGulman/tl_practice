import 'package:flutter/material.dart';
import 'package:stage3/data/language.dart';
import 'package:stage3/language_filters_provider.dart';
import 'package:stage3/print_words_provider.dart';
import 'package:stage3/style.dart';
import 'package:stage3/words_list.dart';
import 'package:stage3/words_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: WordsProvider(
        child: LanguageFiltersProvider(
          child: PrintWordsProvider(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _WordLanguageDropdownField()),
                    Expanded(child: _TranslationLanguageDropdownField()),
                    Expanded(child: Center(child: _PrintButton())),
                  ],
                ),
                const SizedBox(
                  height: 56,
                ),
                const WordsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PrintButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = PrintWordsInheritedNotifier.of(context);
    final wordIds = model.wordIds;
    final wordsLength = wordIds.length;
    final wordsLengthString = wordsLength == 0 ? '' : ' $wordsLength words';

    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: fontSize),
      ),
      onPressed: wordsLength == 0 ? null : model.printWords,
      child: Text('Print$wordsLengthString'),
    );
  }
}

class _WordLanguageDropdownField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = LanguageFiltersInheritedNotifier.of(context);

    return _LanguageDropdownField(
      value: model.wordLanguage,
      onChanged: (Language value) => model.wordLanguage = value,
      label: 'Word language:',
    );
  }
}

class _TranslationLanguageDropdownField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = LanguageFiltersInheritedNotifier.of(context);

    return _LanguageDropdownField(
      value: model.translationLanguage,
      onChanged: (Language value) => model.translationLanguage = value,
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
        const SizedBox(width: 24),
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
