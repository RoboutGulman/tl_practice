import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_code_generating/data/word.dart';
import 'package:words_dictionary_code_generating/model/words_dictionary_state.dart';

part 'word_checkbox.g.dart';

@cwidget
Widget wordCheckbox(BuildContext context, WidgetRef ref, Word word) {
  final model = ref.watch(wordsDictionaryProvider);

  return Checkbox(
    checkColor: Colors.white,
    value: model.selectedWordIds.contains(word.id),
    onChanged: (bool? value) => ((value ?? false)
        ? ref.read(wordsDictionaryProvider.notifier).selectWord
        : ref.read(wordsDictionaryProvider.notifier).unselectWord)(word.id),
  );
}
