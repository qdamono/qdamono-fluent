// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CurrentSelectionData {
  String get text => throw _privateConstructorUsedError;
  int get lineStart => throw _privateConstructorUsedError;
  int get lineEnd => throw _privateConstructorUsedError;
  int get positionStart => throw _privateConstructorUsedError;
  int get positionEnd => throw _privateConstructorUsedError;
  List<Rect> get selectionRects => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentSelectionDataCopyWith<CurrentSelectionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentSelectionDataCopyWith<$Res> {
  factory $CurrentSelectionDataCopyWith(CurrentSelectionData value,
          $Res Function(CurrentSelectionData) then) =
      _$CurrentSelectionDataCopyWithImpl<$Res, CurrentSelectionData>;
  @useResult
  $Res call(
      {String text,
      int lineStart,
      int lineEnd,
      int positionStart,
      int positionEnd,
      List<Rect> selectionRects});
}

/// @nodoc
class _$CurrentSelectionDataCopyWithImpl<$Res,
        $Val extends CurrentSelectionData>
    implements $CurrentSelectionDataCopyWith<$Res> {
  _$CurrentSelectionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? lineStart = null,
    Object? lineEnd = null,
    Object? positionStart = null,
    Object? positionEnd = null,
    Object? selectionRects = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      lineStart: null == lineStart
          ? _value.lineStart
          : lineStart // ignore: cast_nullable_to_non_nullable
              as int,
      lineEnd: null == lineEnd
          ? _value.lineEnd
          : lineEnd // ignore: cast_nullable_to_non_nullable
              as int,
      positionStart: null == positionStart
          ? _value.positionStart
          : positionStart // ignore: cast_nullable_to_non_nullable
              as int,
      positionEnd: null == positionEnd
          ? _value.positionEnd
          : positionEnd // ignore: cast_nullable_to_non_nullable
              as int,
      selectionRects: null == selectionRects
          ? _value.selectionRects
          : selectionRects // ignore: cast_nullable_to_non_nullable
              as List<Rect>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentSelectionDataImplCopyWith<$Res>
    implements $CurrentSelectionDataCopyWith<$Res> {
  factory _$$CurrentSelectionDataImplCopyWith(_$CurrentSelectionDataImpl value,
          $Res Function(_$CurrentSelectionDataImpl) then) =
      __$$CurrentSelectionDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      int lineStart,
      int lineEnd,
      int positionStart,
      int positionEnd,
      List<Rect> selectionRects});
}

/// @nodoc
class __$$CurrentSelectionDataImplCopyWithImpl<$Res>
    extends _$CurrentSelectionDataCopyWithImpl<$Res, _$CurrentSelectionDataImpl>
    implements _$$CurrentSelectionDataImplCopyWith<$Res> {
  __$$CurrentSelectionDataImplCopyWithImpl(_$CurrentSelectionDataImpl _value,
      $Res Function(_$CurrentSelectionDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? lineStart = null,
    Object? lineEnd = null,
    Object? positionStart = null,
    Object? positionEnd = null,
    Object? selectionRects = null,
  }) {
    return _then(_$CurrentSelectionDataImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      lineStart: null == lineStart
          ? _value.lineStart
          : lineStart // ignore: cast_nullable_to_non_nullable
              as int,
      lineEnd: null == lineEnd
          ? _value.lineEnd
          : lineEnd // ignore: cast_nullable_to_non_nullable
              as int,
      positionStart: null == positionStart
          ? _value.positionStart
          : positionStart // ignore: cast_nullable_to_non_nullable
              as int,
      positionEnd: null == positionEnd
          ? _value.positionEnd
          : positionEnd // ignore: cast_nullable_to_non_nullable
              as int,
      selectionRects: null == selectionRects
          ? _value._selectionRects
          : selectionRects // ignore: cast_nullable_to_non_nullable
              as List<Rect>,
    ));
  }
}

/// @nodoc

class _$CurrentSelectionDataImpl implements _CurrentSelectionData {
  const _$CurrentSelectionDataImpl(
      {required this.text,
      required this.lineStart,
      required this.lineEnd,
      required this.positionStart,
      required this.positionEnd,
      required final List<Rect> selectionRects})
      : _selectionRects = selectionRects;

  @override
  final String text;
  @override
  final int lineStart;
  @override
  final int lineEnd;
  @override
  final int positionStart;
  @override
  final int positionEnd;
  final List<Rect> _selectionRects;
  @override
  List<Rect> get selectionRects {
    if (_selectionRects is EqualUnmodifiableListView) return _selectionRects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectionRects);
  }

  @override
  String toString() {
    return 'CurrentSelectionData(text: $text, lineStart: $lineStart, lineEnd: $lineEnd, positionStart: $positionStart, positionEnd: $positionEnd, selectionRects: $selectionRects)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentSelectionDataImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.lineStart, lineStart) ||
                other.lineStart == lineStart) &&
            (identical(other.lineEnd, lineEnd) || other.lineEnd == lineEnd) &&
            (identical(other.positionStart, positionStart) ||
                other.positionStart == positionStart) &&
            (identical(other.positionEnd, positionEnd) ||
                other.positionEnd == positionEnd) &&
            const DeepCollectionEquality()
                .equals(other._selectionRects, _selectionRects));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      text,
      lineStart,
      lineEnd,
      positionStart,
      positionEnd,
      const DeepCollectionEquality().hash(_selectionRects));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentSelectionDataImplCopyWith<_$CurrentSelectionDataImpl>
      get copyWith =>
          __$$CurrentSelectionDataImplCopyWithImpl<_$CurrentSelectionDataImpl>(
              this, _$identity);
}

abstract class _CurrentSelectionData implements CurrentSelectionData {
  const factory _CurrentSelectionData(
      {required final String text,
      required final int lineStart,
      required final int lineEnd,
      required final int positionStart,
      required final int positionEnd,
      required final List<Rect> selectionRects}) = _$CurrentSelectionDataImpl;

  @override
  String get text;
  @override
  int get lineStart;
  @override
  int get lineEnd;
  @override
  int get positionStart;
  @override
  int get positionEnd;
  @override
  List<Rect> get selectionRects;
  @override
  @JsonKey(ignore: true)
  _$$CurrentSelectionDataImplCopyWith<_$CurrentSelectionDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
