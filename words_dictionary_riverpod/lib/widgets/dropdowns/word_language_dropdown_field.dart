import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/language.dart';
import 'package:words_dictionary_riverpod/model/currrent_language_state.dart';

import 'language_dropdown_field.dart';

class WordLanguageDropdownField extends ConsumerWidget {
  const WordLanguageDropdownField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LanguageDropdownField(
      value: ref.watch(currentLanguagesProvider).wordLanguage,
      onChanged: (Language value) =>
          ref.read(currentLanguagesProvider.notifier).setWordLanguage(value),
      label: 'Word language:',
    );
  }
}
