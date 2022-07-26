import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_code_generating/model/words_dictionary_state.dart';
import 'package:words_dictionary_code_generating/widgets/style.dart';

part 'delete_button.g.dart';

@cwidget
Widget deleteButton(BuildContext context, WidgetRef ref) {
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
