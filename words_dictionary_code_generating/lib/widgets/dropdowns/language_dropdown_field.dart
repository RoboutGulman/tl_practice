import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_code_generating/data/language.dart';
import 'package:words_dictionary_code_generating/widgets/style.dart';

part 'language_dropdown_field.g.dart';

@swidget
Widget languageDropdownField(
  value,
  onChanged,
  label,
) {
  return Row(
    children: [
      Text(
        label,
        style: const TextStyle(fontSize: fontSize),
      ),
      const SizedBox(width: 20),
      DropdownButton<Language>(
        value: value,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple, fontSize: fontSize),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (Language? newValue) {
          if (newValue != null) {
            onChanged(newValue);
          }
        },
        items: Language.values
            .map((Language value) => DropdownMenuItem<Language>(
                  value: value,
                  child: Text(value.name),
                ))
            .toList(),
      ),
    ],
  );
}
