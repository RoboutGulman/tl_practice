// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currrent_language_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CurrentLanguages _$$_CurrentLanguagesFromJson(Map<String, dynamic> json) =>
    _$_CurrentLanguages(
      wordLanguage: $enumDecode(_$LanguageEnumMap, json['wordLanguage']),
      translationLanguage:
          $enumDecode(_$LanguageEnumMap, json['translationLanguage']),
    );

Map<String, dynamic> _$$_CurrentLanguagesToJson(_$_CurrentLanguages instance) =>
    <String, dynamic>{
      'wordLanguage': _$LanguageEnumMap[instance.wordLanguage]!,
      'translationLanguage': _$LanguageEnumMap[instance.translationLanguage]!,
    };

const _$LanguageEnumMap = {
  Language.russian: 'russian',
  Language.english: 'english',
  Language.german: 'german',
  Language.french: 'french',
};
