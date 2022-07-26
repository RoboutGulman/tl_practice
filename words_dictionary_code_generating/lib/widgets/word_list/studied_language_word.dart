import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_code_generating/data/word.dart';
import 'package:words_dictionary_code_generating/model/currrent_language_state.dart';
import 'package:words_dictionary_code_generating/widgets/style.dart';

part 'studied_language_word.g.dart';

@cwidget
Widget studiedLanguageWord(BuildContext context, WidgetRef ref, Word word){
return Text(
      word.translations[
              ref.watch(currentLanguagesProvider).translationLanguage] ??
          '',
      style: const TextStyle(fontSize: fontSize),
    );
}
