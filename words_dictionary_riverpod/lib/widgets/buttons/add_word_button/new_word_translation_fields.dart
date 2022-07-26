import 'package:flutter/material.dart';
import 'package:words_dictionary_riverpod/data/language.dart';

class NewWordTranslationFields extends StatelessWidget {
  const NewWordTranslationFields(this.changeTranslations, {Key? key})
      : super(key: key);

  final Function changeTranslations;
  @override
  Widget build(BuildContext context) {
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
}
