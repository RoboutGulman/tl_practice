/* cSpell:disable */

import 'language.dart';
import 'word.dart';

final _words = [
  const Word(
    id: 1,
    translations: {
      Language.english: 'hello',
      Language.french: 'bonjour',
      Language.german: 'hallo',
      Language.russian: 'привет',
    },
  ),
  const Word(
    id: 2,
    translations: {
      Language.english: 'goodbye',
      Language.french: 'au revoir',
      Language.german: 'auf wiedersehen',
      Language.russian: 'до свидания',
    },
  ),
  const Word(
    id: 3,
    translations: {
      Language.english: 'forest',
      Language.french: 'forêt',
      Language.german: 'wald',
      Language.russian: 'лес',
    },
  ),
  const Word(
    id: 4,
    translations: {
      Language.english: 'nature',
      Language.french: 'la nature',
      Language.german: 'natur',
      Language.russian: 'природа',
    },
  ),
  const Word(id: 5, translations: {
    Language.english: 'ocean',
    Language.french: 'océan',
    Language.german: 'ozean',
    Language.russian: 'океан',
  }),
];
/* pell:enable */

List<Word> getWords() => _words.toList();
