import 'package:flutter/material.dart';
import 'package:stage3/data/word.dart';
import 'package:stage3/language_filters_provider.dart';
import 'package:stage3/style.dart';
import 'package:stage3/words_provider.dart';

class WordsList extends StatefulWidget {
  const WordsList({Key? key}) : super(key: key);

  @override
  State<WordsList> createState() => _WordsListState();
}

class _WordsListState extends State<WordsList> {
  @override
  Widget build(BuildContext context) {
    final words = WordsInheritedNotifier.of(context).wordList;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: words.length,
      itemBuilder: (_, index) {
        final word = words[index];

        return Row(
          children: [
            Expanded(child: _NativeLanguageWord(word: word)),
            Expanded(child: _StudiedLanguageWord(word: word)),
            Expanded(child: _WordCheckbox(word: word)),
          ],
        );
      },
    );
  }
}

class _NativeLanguageWord extends StatelessWidget {
  const _NativeLanguageWord({Key? key, required this.word}) : super(key: key);

  final Word word;

  @override
  Widget build(BuildContext context) {
    return Text(
      word.translations[
              LanguageFiltersInheritedNotifier.of(context).wordLanguage] ??
          '',
      style: const TextStyle(fontSize: fontSize),
    );
  }
}

class _StudiedLanguageWord extends StatelessWidget {
  const _StudiedLanguageWord({Key? key, required this.word}) : super(key: key);

  final Word word;

  @override
  Widget build(BuildContext context) {
    return Text(
      word.translations[LanguageFiltersInheritedNotifier.of(context)
              .translationLanguage] ??
          '',
      style: const TextStyle(fontSize: fontSize),
    );
  }
}

class _WordCheckbox extends StatelessWidget {
  const _WordCheckbox({Key? key, required this.word}) : super(key: key);

  final Word word;

  @override
  Widget build(BuildContext context) {
    final model = WordsInheritedNotifier.of(context);

    return Checkbox(
      checkColor: Colors.white,
      value: model.selectedWordIds.contains(word.id),
      onChanged: (bool? value) => ((value ?? false)
          ? model.selectWord
          : model.unselectWord)(word.id),
    );
  }
}
