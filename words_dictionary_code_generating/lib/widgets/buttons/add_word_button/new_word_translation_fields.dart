import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_code_generating/data/language.dart';

part 'new_word_translation_fields.g.dart';

@swidget
Widget newWordTranslationFields(
    BuildContext context,{required Function changeTranslations} ) {
  return Column(
    children: Language.values
        .map(
          (Language value) => TextField(
            onChanged: (String string) => {changeTranslations(value, string)},
            decoration: InputDecoration(
              labelText: value.name,
            ),
          ),
        )
        .toList(),
  );
}
