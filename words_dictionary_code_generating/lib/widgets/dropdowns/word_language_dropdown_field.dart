import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_code_generating/data/language.dart';
import 'package:words_dictionary_code_generating/model/currrent_language_state.dart';

import 'language_dropdown_field.dart';

part 'word_language_dropdown_field.g.dart';

@cwidget
Widget wordLanguageDropdownField(BuildContext context, WidgetRef ref) {
  return LanguageDropdownField(
    ref.watch(currentLanguagesProvider).wordLanguage,
    (Language value) =>
        ref.read(currentLanguagesProvider.notifier).setWordLanguage(value),
    'Word language:',
  );
}
