// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'words_dictionary_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WordsDictionary _$$_WordsDictionaryFromJson(Map<String, dynamic> json) =>
    _$_WordsDictionary(
      wordList: (json['wordList'] as List<dynamic>)
          .map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedWordIds: (json['selectedWordIds'] as List<dynamic>)
          .map((e) => e as int)
          .toSet(),
      maxId: json['maxId'] as int,
    );

Map<String, dynamic> _$$_WordsDictionaryToJson(_$_WordsDictionary instance) =>
    <String, dynamic>{
      'wordList': instance.wordList.map((e) => e.toJson()).toList(),
      'selectedWordIds': instance.selectedWordIds.toList(),
      'maxId': instance.maxId,
    };
