// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'words_dictionary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WordsDictionary _$WordsDictionaryFromJson(Map<String, dynamic> json) {
  return _WordsDictionary.fromJson(json);
}

/// @nodoc
mixin _$WordsDictionary {
  List<Word> get wordList => throw _privateConstructorUsedError;
  Set<int> get selectedWordIds => throw _privateConstructorUsedError;
  int get maxId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordsDictionaryCopyWith<WordsDictionary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordsDictionaryCopyWith<$Res> {
  factory $WordsDictionaryCopyWith(
          WordsDictionary value, $Res Function(WordsDictionary) then) =
      _$WordsDictionaryCopyWithImpl<$Res>;
  $Res call({List<Word> wordList, Set<int> selectedWordIds, int maxId});
}

/// @nodoc
class _$WordsDictionaryCopyWithImpl<$Res>
    implements $WordsDictionaryCopyWith<$Res> {
  _$WordsDictionaryCopyWithImpl(this._value, this._then);

  final WordsDictionary _value;
  // ignore: unused_field
  final $Res Function(WordsDictionary) _then;

  @override
  $Res call({
    Object? wordList = freezed,
    Object? selectedWordIds = freezed,
    Object? maxId = freezed,
  }) {
    return _then(_value.copyWith(
      wordList: wordList == freezed
          ? _value.wordList
          : wordList // ignore: cast_nullable_to_non_nullable
              as List<Word>,
      selectedWordIds: selectedWordIds == freezed
          ? _value.selectedWordIds
          : selectedWordIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      maxId: maxId == freezed
          ? _value.maxId
          : maxId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_WordsDictionaryCopyWith<$Res>
    implements $WordsDictionaryCopyWith<$Res> {
  factory _$$_WordsDictionaryCopyWith(
          _$_WordsDictionary value, $Res Function(_$_WordsDictionary) then) =
      __$$_WordsDictionaryCopyWithImpl<$Res>;
  @override
  $Res call({List<Word> wordList, Set<int> selectedWordIds, int maxId});
}

/// @nodoc
class __$$_WordsDictionaryCopyWithImpl<$Res>
    extends _$WordsDictionaryCopyWithImpl<$Res>
    implements _$$_WordsDictionaryCopyWith<$Res> {
  __$$_WordsDictionaryCopyWithImpl(
      _$_WordsDictionary _value, $Res Function(_$_WordsDictionary) _then)
      : super(_value, (v) => _then(v as _$_WordsDictionary));

  @override
  _$_WordsDictionary get _value => super._value as _$_WordsDictionary;

  @override
  $Res call({
    Object? wordList = freezed,
    Object? selectedWordIds = freezed,
    Object? maxId = freezed,
  }) {
    return _then(_$_WordsDictionary(
      wordList: wordList == freezed
          ? _value._wordList
          : wordList // ignore: cast_nullable_to_non_nullable
              as List<Word>,
      selectedWordIds: selectedWordIds == freezed
          ? _value._selectedWordIds
          : selectedWordIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      maxId: maxId == freezed
          ? _value.maxId
          : maxId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_WordsDictionary extends _WordsDictionary {
  const _$_WordsDictionary(
      {required final List<Word> wordList,
      required final Set<int> selectedWordIds,
      required this.maxId})
      : _wordList = wordList,
        _selectedWordIds = selectedWordIds,
        super._();

  factory _$_WordsDictionary.fromJson(Map<String, dynamic> json) =>
      _$$_WordsDictionaryFromJson(json);

  final List<Word> _wordList;
  @override
  List<Word> get wordList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordList);
  }

  final Set<int> _selectedWordIds;
  @override
  Set<int> get selectedWordIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedWordIds);
  }

  @override
  final int maxId;

  @override
  String toString() {
    return 'WordsDictionary(wordList: $wordList, selectedWordIds: $selectedWordIds, maxId: $maxId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordsDictionary &&
            const DeepCollectionEquality().equals(other._wordList, _wordList) &&
            const DeepCollectionEquality()
                .equals(other._selectedWordIds, _selectedWordIds) &&
            const DeepCollectionEquality().equals(other.maxId, maxId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_wordList),
      const DeepCollectionEquality().hash(_selectedWordIds),
      const DeepCollectionEquality().hash(maxId));

  @JsonKey(ignore: true)
  @override
  _$$_WordsDictionaryCopyWith<_$_WordsDictionary> get copyWith =>
      __$$_WordsDictionaryCopyWithImpl<_$_WordsDictionary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordsDictionaryToJson(
      this,
    );
  }
}

abstract class _WordsDictionary extends WordsDictionary {
  const factory _WordsDictionary(
      {required final List<Word> wordList,
      required final Set<int> selectedWordIds,
      required final int maxId}) = _$_WordsDictionary;
  const _WordsDictionary._() : super._();

  factory _WordsDictionary.fromJson(Map<String, dynamic> json) =
      _$_WordsDictionary.fromJson;

  @override
  List<Word> get wordList;
  @override
  Set<int> get selectedWordIds;
  @override
  int get maxId;
  @override
  @JsonKey(ignore: true)
  _$$_WordsDictionaryCopyWith<_$_WordsDictionary> get copyWith =>
      throw _privateConstructorUsedError;
}
