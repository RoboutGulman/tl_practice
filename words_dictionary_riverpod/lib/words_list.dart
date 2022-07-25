import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/word.dart';
import 'package:words_dictionary_riverpod/style.dart';

import 'model/words_dictionary_state.dart';

class WordsList extends ConsumerWidget {
  const WordsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final words = ref.watch(wordsDictionaryProvider).wordList;
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

class _NativeLanguageWord extends ConsumerWidget {
  const _NativeLanguageWord({Key? key, required this.word}) : super(key: key);

  final Word word;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      word.translations[ref.watch(currentLanguagesProvider).wordLanguage] ?? '',
      style: const TextStyle(fontSize: fontSize),
    );
  }
}

class _StudiedLanguageWord extends ConsumerWidget {
  const _StudiedLanguageWord({Key? key, required this.word}) : super(key: key);

  final Word word;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      word.translations[
              ref.watch(currentLanguagesProvider).translationLanguage] ??
          '',
      style: const TextStyle(fontSize: fontSize),
    );
  }
}

class _WordCheckbox extends ConsumerWidget {
  const _WordCheckbox({Key? key, required this.word}) : super(key: key);

  final Word word;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(wordsDictionaryProvider);
    ;

    return Checkbox(
      checkColor: Colors.white,
      value: model.selectedWordIds.contains(word.id),
      onChanged: (bool? value) => ((value ?? false)
          ? ref.read(wordsDictionaryProvider.notifier).selectWord
          : ref.read(wordsDictionaryProvider.notifier).unselectWord)(word.id),
    );
  }
}
