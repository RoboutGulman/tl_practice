// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Word _$WordFromJson(Map<String, dynamic> json) {
  return _Word.fromJson(json);
}

/// @nodoc
mixin _$Word {
  Map<Language, String> get translations => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordCopyWith<Word> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordCopyWith<$Res> {
  factory $WordCopyWith(Word value, $Res Function(Word) then) =
      _$WordCopyWithImpl<$Res>;
  $Res call({Map<Language, String> translations, int id});
}

/// @nodoc
class _$WordCopyWithImpl<$Res> implements $WordCopyWith<$Res> {
  _$WordCopyWithImpl(this._value, this._then);

  final Word _value;
  // ignore: unused_field
  final $Res Function(Word) _then;

  @override
  $Res call({
    Object? translations = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      translations: translations == freezed
          ? _value.translations
          : translations // ignore: cast_nullable_to_non_nullable
              as Map<Language, String>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_WordCopyWith<$Res> implements $WordCopyWith<$Res> {
  factory _$$_WordCopyWith(_$_Word value, $Res Function(_$_Word) then) =
      __$$_WordCopyWithImpl<$Res>;
  @override
  $Res call({Map<Language, String> translations, int id});
}

/// @nodoc
class __$$_WordCopyWithImpl<$Res> extends _$WordCopyWithImpl<$Res>
    implements _$$_WordCopyWith<$Res> {
  __$$_WordCopyWithImpl(_$_Word _value, $Res Function(_$_Word) _then)
      : super(_value, (v) => _then(v as _$_Word));

  @override
  _$_Word get _value => super._value as _$_Word;

  @override
  $Res call({
    Object? translations = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_Word(
      translations: translations == freezed
          ? _value._translations
          : translations // ignore: cast_nullable_to_non_nullable
              as Map<Language, String>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Word implements _Word {
  const _$_Word(
      {required final Map<Language, String> translations, required this.id})
      : _translations = translations;

  factory _$_Word.fromJson(Map<String, dynamic> json) => _$$_WordFromJson(json);

  final Map<Language, String> _translations;
  @override
  Map<Language, String> get translations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_translations);
  }

  @override
  final int id;

  @override
  String toString() {
    return 'Word(translations: $translations, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Word &&
            const DeepCollectionEquality()
                .equals(other._translations, _translations) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_translations),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_WordCopyWith<_$_Word> get copyWith =>
      __$$_WordCopyWithImpl<_$_Word>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordToJson(
      this,
    );
  }
}

abstract class _Word implements Word {
  const factory _Word(
      {required final Map<Language, String> translations,
      required final int id}) = _$_Word;

  factory _Word.fromJson(Map<String, dynamic> json) = _$_Word.fromJson;

  @override
  Map<Language, String> get translations;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_WordCopyWith<_$_Word> get copyWith => throw _privateConstructorUsedError;
}
