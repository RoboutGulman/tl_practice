import 'package:freezed_annotation/freezed_annotation.dart';

import 'language.dart';
part 'word.freezed.dart';
part 'word.g.dart';

@freezed
class Word with _$Word {
  const factory Word({
    required Map<Language, String> translations,
    required int id,
  }) = _Word;

  factory Word.fromJson(Map<String, Object?> json) => _$WordFromJson(json);
}
