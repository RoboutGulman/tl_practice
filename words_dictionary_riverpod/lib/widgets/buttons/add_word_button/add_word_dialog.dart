import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'new_word_translation_fields.dart';

class AddWordDialog extends ConsumerWidget {
  const AddWordDialog(
      this.changeTranslations, this.clearTranslations, this.addWordToDictionary,
      {Key? key})
      : super(key: key);

  final Function changeTranslations;
  final Function clearTranslations;
  final Function addWordToDictionary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('Type word in all of languages'),
      content: NewWordTranslationFields(changeTranslations),
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
}
