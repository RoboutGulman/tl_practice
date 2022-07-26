import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/language.dart';
import 'package:words_dictionary_riverpod/model/currrent_language_state.dart';

import 'language_dropdown_field.dart';

class TranslationLanguageDropdownField extends ConsumerWidget {
  const TranslationLanguageDropdownField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LanguageDropdownField(
      value: ref.watch(currentLanguagesProvider).translationLanguage,
      onChanged: (Language value) => ref
          .read(currentLanguagesProvider.notifier)
          .setTranslationLanguage(value),
      label: 'Translation language:',
    );
  }
}
