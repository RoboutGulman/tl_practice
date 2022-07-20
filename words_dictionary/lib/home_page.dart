import 'package:flutter/material.dart';
import 'package:stage3/data/language.dart';
import 'package:stage3/language_filters_provider.dart';
import 'package:stage3/style.dart';
import 'package:stage3/words_list.dart';
import 'package:stage3/words_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: LanguageFiltersProvider(
        child: WordsProvider(
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
        ),
      ),
    );
  }
}

class _DeleteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = WordsInheritedNotifier.of(context);
    final wordIds = model.selectedWordIds;
    final wordsLength = wordIds.length;
    final wordsLengthString = wordsLength == 0 ? '' : ' $wordsLength words';

    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: fontSize),
      ),
      onPressed: wordsLength == 0 ? null : model.removeSelectedWords,
      child: Text('Delete$wordsLengthString'),
    );
  }
}

class _PrintButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = WordsInheritedNotifier.of(context);
    final wordIds = model.selectedWordIds;
    final wordsLength = wordIds.length;
    final wordsLengthString = wordsLength == 0 ? '' : ' $wordsLength words';

    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: fontSize),
      ),
      onPressed: wordsLength == 0 ? null : model.printSelectedWords,
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

class _AddWordButton extends StatefulWidget {
  const _AddWordButton({Key? key}) : super(key: key);

  @override
  State<_AddWordButton> createState() => _AddWordButtonState();
}

class _AddWordButtonState extends State<_AddWordButton> {
  Map<Language, String> translations = {};

  _onChange(Language language, String value) {
    translations[language] = value;
  }

  _clearTranslations() {
    translations.clear();
  }

  @override
  Widget build(BuildContext context) {
    final model = WordsInheritedNotifier.of(context);
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Type word in all of languages'),
          content: Column(
            children: Language.values
                .map(
                  (Language value) => TextField(
                    onChanged: (String string) => {_onChange(value, string)},
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
              onPressed: () =>
                  {Navigator.pop(context, 'Cancel'), _clearTranslations()},
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => {
                model.addWord(translations),
                _clearTranslations(),
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
