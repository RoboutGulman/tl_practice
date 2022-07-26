import 'package:flutter/material.dart';

import 'buttons/add_word_button/add_word_button.dart';
import 'buttons/delete_button.dart';
import 'buttons/print_button.dart';
import 'dropdowns/translation_language_dropdown_field.dart';
import 'dropdowns/word_language_dropdown_field.dart';
import 'word_list/words_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(flex: 2, child: WordLanguageDropdownField()),
              const Expanded(
                  flex: 2, child: TranslationLanguageDropdownField()),
              Expanded(
                flex: 3,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      AddWordButton(),
                      PrintButton(),
                      DeleteButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 56,
          ),
          const WordsList(),
        ],
      ),
    );
  }
}
