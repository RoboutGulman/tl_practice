import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_code_generating/widgets/style.dart';

import 'add_word_dialog.dart';

part 'add_word_button.g.dart';

@hcwidget
Widget addWordButton(BuildContext context, WidgetRef ref) {
  return TextButton(
    onPressed: () => showDialog<String>(
        context: context, builder: (BuildContext context) => const AddWordDialog()),
    child: const Text(
      'Add new Word',
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.normal),
    ),
  );
}
