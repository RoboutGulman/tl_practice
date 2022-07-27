// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'currrent_language_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrentLanguages _$CurrentLanguagesFromJson(Map<String, dynamic> json) {
  return _CurrentLanguages.fromJson(json);
}

/// @nodoc
mixin _$CurrentLanguages {
  Language get wordLanguage => throw _privateConstructorUsedError;
  Language get translationLanguage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentLanguagesCopyWith<CurrentLanguages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentLanguagesCopyWith<$Res> {
  factory $CurrentLanguagesCopyWith(
          CurrentLanguages value, $Res Function(CurrentLanguages) then) =
      _$CurrentLanguagesCopyWithImpl<$Res>;
  $Res call({Language wordLanguage, Language translationLanguage});
}

/// @nodoc
class _$CurrentLanguagesCopyWithImpl<$Res>
    implements $CurrentLanguagesCopyWith<$Res> {
  _$CurrentLanguagesCopyWithImpl(this._value, this._then);

  final CurrentLanguages _value;
  // ignore: unused_field
  final $Res Function(CurrentLanguages) _then;

  @override
  $Res call({
    Object? wordLanguage = freezed,
    Object? translationLanguage = freezed,
  }) {
    return _then(_value.copyWith(
      wordLanguage: wordLanguage == freezed
          ? _value.wordLanguage
          : wordLanguage // ignore: cast_nullable_to_non_nullable
              as Language,
      translationLanguage: translationLanguage == freezed
          ? _value.translationLanguage
          : translationLanguage // ignore: cast_nullable_to_non_nullable
              as Language,
    ));
  }
}

/// @nodoc
abstract class _$$_CurrentLanguagesCopyWith<$Res>
    implements $CurrentLanguagesCopyWith<$Res> {
  factory _$$_CurrentLanguagesCopyWith(
          _$_CurrentLanguages value, $Res Function(_$_CurrentLanguages) then) =
      __$$_CurrentLanguagesCopyWithImpl<$Res>;
  @override
  $Res call({Language wordLanguage, Language translationLanguage});
}

/// @nodoc
class __$$_CurrentLanguagesCopyWithImpl<$Res>
    extends _$CurrentLanguagesCopyWithImpl<$Res>
    implements _$$_CurrentLanguagesCopyWith<$Res> {
  __$$_CurrentLanguagesCopyWithImpl(
      _$_CurrentLanguages _value, $Res Function(_$_CurrentLanguages) _then)
      : super(_value, (v) => _then(v as _$_CurrentLanguages));

  @override
  _$_CurrentLanguages get _value => super._value as _$_CurrentLanguages;

  @override
  $Res call({
    Object? wordLanguage = freezed,
    Object? translationLanguage = freezed,
  }) {
    return _then(_$_CurrentLanguages(
      wordLanguage: wordLanguage == freezed
          ? _value.wordLanguage
          : wordLanguage // ignore: cast_nullable_to_non_nullable
              as Language,
      translationLanguage: translationLanguage == freezed
          ? _value.translationLanguage
          : translationLanguage // ignore: cast_nullable_to_non_nullable
              as Language,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CurrentLanguages implements _CurrentLanguages {
  const _$_CurrentLanguages(
      {required this.wordLanguage, required this.translationLanguage});

  factory _$_CurrentLanguages.fromJson(Map<String, dynamic> json) =>
      _$$_CurrentLanguagesFromJson(json);

  @override
  final Language wordLanguage;
  @override
  final Language translationLanguage;

  @override
  String toString() {
    return 'CurrentLanguages(wordLanguage: $wordLanguage, translationLanguage: $translationLanguage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrentLanguages &&
            const DeepCollectionEquality()
                .equals(other.wordLanguage, wordLanguage) &&
            const DeepCollectionEquality()
                .equals(other.translationLanguage, translationLanguage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(wordLanguage),
      const DeepCollectionEquality().hash(translationLanguage));

  @JsonKey(ignore: true)
  @override
  _$$_CurrentLanguagesCopyWith<_$_CurrentLanguages> get copyWith =>
      __$$_CurrentLanguagesCopyWithImpl<_$_CurrentLanguages>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrentLanguagesToJson(
      this,
    );
  }
}

abstract class _CurrentLanguages implements CurrentLanguages {
  const factory _CurrentLanguages(
      {required final Language wordLanguage,
      required final Language translationLanguage}) = _$_CurrentLanguages;

  factory _CurrentLanguages.fromJson(Map<String, dynamic> json) =
      _$_CurrentLanguages.fromJson;

  @override
  Language get wordLanguage;
  @override
  Language get translationLanguage;
  @override
  @JsonKey(ignore: true)
  _$$_CurrentLanguagesCopyWith<_$_CurrentLanguages> get copyWith =>
      throw _privateConstructorUsedError;
}
