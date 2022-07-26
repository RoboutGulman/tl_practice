import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/word.dart';
import 'package:words_dictionary_riverpod/model/currrent_language_state.dart';
import 'package:words_dictionary_riverpod/widgets/style.dart';

class NativeLanguageWord extends ConsumerWidget {
  const NativeLanguageWord({Key? key, required this.word}) : super(key: key);

  final Word word;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      word.translations[ref.watch(currentLanguagesProvider).wordLanguage] ?? '',
      style: const TextStyle(fontSize: fontSize),
    );
  }
}
