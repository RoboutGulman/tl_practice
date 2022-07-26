import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/model/words_dictionary_state.dart';

import 'native_language_word.dart';
import 'studied_language_word.dart';
import 'word_checkbox.dart';

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
