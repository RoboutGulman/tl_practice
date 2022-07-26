import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/model/words_dictionary_state.dart';
import 'package:words_dictionary_riverpod/widgets/style.dart';

class DeleteButton extends ConsumerWidget {
  const DeleteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
}
