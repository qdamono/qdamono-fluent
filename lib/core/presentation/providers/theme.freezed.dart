// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppThemeData {
  Color get dividerColor => throw _privateConstructorUsedError;
  Color get dividerHighlightedColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppThemeDataCopyWith<AppThemeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppThemeDataCopyWith<$Res> {
  factory $AppThemeDataCopyWith(
          AppThemeData value, $Res Function(AppThemeData) then) =
      _$AppThemeDataCopyWithImpl<$Res, AppThemeData>;
  @useResult
  $Res call({Color dividerColor, Color dividerHighlightedColor});
}

/// @nodoc
class _$AppThemeDataCopyWithImpl<$Res, $Val extends AppThemeData>
    implements $AppThemeDataCopyWith<$Res> {
  _$AppThemeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dividerColor = null,
    Object? dividerHighlightedColor = null,
  }) {
    return _then(_value.copyWith(
      dividerColor: null == dividerColor
          ? _value.dividerColor
          : dividerColor // ignore: cast_nullable_to_non_nullable
              as Color,
      dividerHighlightedColor: null == dividerHighlightedColor
          ? _value.dividerHighlightedColor
          : dividerHighlightedColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppThemeDataImplCopyWith<$Res>
    implements $AppThemeDataCopyWith<$Res> {
  factory _$$AppThemeDataImplCopyWith(
          _$AppThemeDataImpl value, $Res Function(_$AppThemeDataImpl) then) =
      __$$AppThemeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Color dividerColor, Color dividerHighlightedColor});
}

/// @nodoc
class __$$AppThemeDataImplCopyWithImpl<$Res>
    extends _$AppThemeDataCopyWithImpl<$Res, _$AppThemeDataImpl>
    implements _$$AppThemeDataImplCopyWith<$Res> {
  __$$AppThemeDataImplCopyWithImpl(
      _$AppThemeDataImpl _value, $Res Function(_$AppThemeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dividerColor = null,
    Object? dividerHighlightedColor = null,
  }) {
    return _then(_$AppThemeDataImpl(
      dividerColor: null == dividerColor
          ? _value.dividerColor
          : dividerColor // ignore: cast_nullable_to_non_nullable
              as Color,
      dividerHighlightedColor: null == dividerHighlightedColor
          ? _value.dividerHighlightedColor
          : dividerHighlightedColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$AppThemeDataImpl implements _AppThemeData {
  const _$AppThemeDataImpl(
      {required this.dividerColor, required this.dividerHighlightedColor});

  @override
  final Color dividerColor;
  @override
  final Color dividerHighlightedColor;

  @override
  String toString() {
    return 'AppThemeData(dividerColor: $dividerColor, dividerHighlightedColor: $dividerHighlightedColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppThemeDataImpl &&
            (identical(other.dividerColor, dividerColor) ||
                other.dividerColor == dividerColor) &&
            (identical(
                    other.dividerHighlightedColor, dividerHighlightedColor) ||
                other.dividerHighlightedColor == dividerHighlightedColor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, dividerColor, dividerHighlightedColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppThemeDataImplCopyWith<_$AppThemeDataImpl> get copyWith =>
      __$$AppThemeDataImplCopyWithImpl<_$AppThemeDataImpl>(this, _$identity);
}

abstract class _AppThemeData implements AppThemeData {
  const factory _AppThemeData(
      {required final Color dividerColor,
      required final Color dividerHighlightedColor}) = _$AppThemeDataImpl;

  @override
  Color get dividerColor;
  @override
  Color get dividerHighlightedColor;
  @override
  @JsonKey(ignore: true)
  _$$AppThemeDataImplCopyWith<_$AppThemeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
