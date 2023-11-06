// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tags.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VisibleTagData {
  Rect get rect => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VisibleTagDataCopyWith<VisibleTagData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisibleTagDataCopyWith<$Res> {
  factory $VisibleTagDataCopyWith(
          VisibleTagData value, $Res Function(VisibleTagData) then) =
      _$VisibleTagDataCopyWithImpl<$Res, VisibleTagData>;
  @useResult
  $Res call({Rect rect, Color color});
}

/// @nodoc
class _$VisibleTagDataCopyWithImpl<$Res, $Val extends VisibleTagData>
    implements $VisibleTagDataCopyWith<$Res> {
  _$VisibleTagDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rect = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      rect: null == rect
          ? _value.rect
          : rect // ignore: cast_nullable_to_non_nullable
              as Rect,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VisibleTagDataImplCopyWith<$Res>
    implements $VisibleTagDataCopyWith<$Res> {
  factory _$$VisibleTagDataImplCopyWith(_$VisibleTagDataImpl value,
          $Res Function(_$VisibleTagDataImpl) then) =
      __$$VisibleTagDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Rect rect, Color color});
}

/// @nodoc
class __$$VisibleTagDataImplCopyWithImpl<$Res>
    extends _$VisibleTagDataCopyWithImpl<$Res, _$VisibleTagDataImpl>
    implements _$$VisibleTagDataImplCopyWith<$Res> {
  __$$VisibleTagDataImplCopyWithImpl(
      _$VisibleTagDataImpl _value, $Res Function(_$VisibleTagDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rect = null,
    Object? color = null,
  }) {
    return _then(_$VisibleTagDataImpl(
      rect: null == rect
          ? _value.rect
          : rect // ignore: cast_nullable_to_non_nullable
              as Rect,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$VisibleTagDataImpl implements _VisibleTagData {
  const _$VisibleTagDataImpl({required this.rect, required this.color});

  @override
  final Rect rect;
  @override
  final Color color;

  @override
  String toString() {
    return 'VisibleTagData(rect: $rect, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisibleTagDataImpl &&
            (identical(other.rect, rect) || other.rect == rect) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rect, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VisibleTagDataImplCopyWith<_$VisibleTagDataImpl> get copyWith =>
      __$$VisibleTagDataImplCopyWithImpl<_$VisibleTagDataImpl>(
          this, _$identity);
}

abstract class _VisibleTagData implements VisibleTagData {
  const factory _VisibleTagData(
      {required final Rect rect,
      required final Color color}) = _$VisibleTagDataImpl;

  @override
  Rect get rect;
  @override
  Color get color;
  @override
  @JsonKey(ignore: true)
  _$$VisibleTagDataImplCopyWith<_$VisibleTagDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
