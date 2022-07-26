import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/word.dart';
import 'package:words_dictionary_riverpod/model/words_dictionary_state.dart';

class WordCheckbox extends ConsumerWidget {
  const WordCheckbox({Key? key, required this.word}) : super(key: key);

  final Word word;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(wordsDictionaryProvider);

    return Checkbox(
      checkColor: Colors.white,
      value: model.selectedWordIds.contains(word.id),
      onChanged: (bool? value) => ((value ?? false)
          ? ref.read(wordsDictionaryProvider.notifier).selectWord
          : ref.read(wordsDictionaryProvider.notifier).unselectWord)(word.id),
    );
  }
}