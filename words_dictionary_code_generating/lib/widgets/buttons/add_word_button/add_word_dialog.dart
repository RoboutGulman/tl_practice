import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

import 'new_word_translation_fields.dart';

part 'add_word_dialog.g.dart';

@cwidget
Widget addWordDialog(BuildContext context, WidgetRef ref,
    {required Function changeTranslations,
    required Function clearTranslations,
    required Function addWordToDictionary}) {
  return AlertDialog(
    title: const Text('Type word in all of languages'),
    content: NewWordTranslationFields(changeTranslations: changeTranslations),
    actions: <Widget>[
      TextButton(
        onPressed: () =>
            {Navigator.pop(context, 'Cancel'), clearTranslations()},
        child: const Text('Cancel'),
      ),
      TextButton(
        onPressed: () => {
          addWordToDictionary(),
          clearTranslations(),
          Navigator.pop(context, 'OK'),
        },
        child: const Text('OK'),
      ),
    ],
  );
}
