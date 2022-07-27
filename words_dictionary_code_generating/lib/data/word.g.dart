// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Word _$$_WordFromJson(Map<String, dynamic> json) => _$_Word(
      translations: (json['translations'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$LanguageEnumMap, k), e as String),
      ),
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_WordToJson(_$_Word instance) => <String, dynamic>{
      'translations': instance.translations
          .map((k, e) => MapEntry(_$LanguageEnumMap[k]!, e)),
      'id': instance.id,
    };

const _$LanguageEnumMap = {
  Language.russian: 'russian',
  Language.english: 'english',
  Language.german: 'german',
  Language.french: 'french',
};
