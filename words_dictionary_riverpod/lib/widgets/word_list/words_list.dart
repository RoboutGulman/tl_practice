import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/widgets/word_list/native_language_word.dart';
import 'package:words_dictionary_riverpod/widgets/word_list/studied_naguage_word.dart';
import 'package:words_dictionary_riverpod/widgets/word_list/word_checkbox.dart';

import '../../model/words_dictionary_state.dart';

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
            Expanded(child: NativeLanguageWord(word: word)),
            Expanded(child: StudiedLanguageWord(word: word)),
            Expanded(child: WordCheckbox(word: word)),
          ],
        );
      },
    );
  }
}
