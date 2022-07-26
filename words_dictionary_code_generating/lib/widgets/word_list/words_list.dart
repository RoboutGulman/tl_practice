import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_code_generating/model/words_dictionary_state.dart';

import 'native_language_word.dart';
import 'studied_language_word.dart';
import 'word_checkbox.dart';

part 'words_list.g.dart';

@cwidget
Widget wordsList(WidgetRef ref) {
  final words = ref.watch(wordsDictionaryProvider).wordList;
  return ListView.builder(
    shrinkWrap: true,
    itemCount: words.length,
    itemBuilder: (_, index) {
      final word = words[index];

      return Row(
        children: [
          Expanded(child: NativeLanguageWord(word)),
          Expanded(child: StudiedLanguageWord(word)),
          Expanded(child: WordCheckbox(word)),
        ],
      );
    },
  );
}
