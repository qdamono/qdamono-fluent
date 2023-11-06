// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_list_menu_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteItem {
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteItemCopyWith<NoteItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteItemCopyWith<$Res> {
  factory $NoteItemCopyWith(NoteItem value, $Res Function(NoteItem) then) =
      _$NoteItemCopyWithImpl<$Res, NoteItem>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$NoteItemCopyWithImpl<$Res, $Val extends NoteItem>
    implements $NoteItemCopyWith<$Res> {
  _$NoteItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteItemImplCopyWith<$Res>
    implements $NoteItemCopyWith<$Res> {
  factory _$$NoteItemImplCopyWith(
          _$NoteItemImpl value, $Res Function(_$NoteItemImpl) then) =
      __$$NoteItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$NoteItemImplCopyWithImpl<$Res>
    extends _$NoteItemCopyWithImpl<$Res, _$NoteItemImpl>
    implements _$$NoteItemImplCopyWith<$Res> {
  __$$NoteItemImplCopyWithImpl(
      _$NoteItemImpl _value, $Res Function(_$NoteItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$NoteItemImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NoteItemImpl implements _NoteItem {
  const _$NoteItemImpl({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'NoteItem(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteItemImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteItemImplCopyWith<_$NoteItemImpl> get copyWith =>
      __$$NoteItemImplCopyWithImpl<_$NoteItemImpl>(this, _$identity);
}

abstract class _NoteItem implements NoteItem {
  const factory _NoteItem({required final String name}) = _$NoteItemImpl;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$NoteItemImplCopyWith<_$NoteItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
