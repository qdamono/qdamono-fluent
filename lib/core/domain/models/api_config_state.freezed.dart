// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_config_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiConfigState {
  String get apiEndpoint => throw _privateConstructorUsedError;
  bool get httpAllowed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiConfigStateCopyWith<ApiConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiConfigStateCopyWith<$Res> {
  factory $ApiConfigStateCopyWith(
          ApiConfigState value, $Res Function(ApiConfigState) then) =
      _$ApiConfigStateCopyWithImpl<$Res, ApiConfigState>;
  @useResult
  $Res call({String apiEndpoint, bool httpAllowed});
}

/// @nodoc
class _$ApiConfigStateCopyWithImpl<$Res, $Val extends ApiConfigState>
    implements $ApiConfigStateCopyWith<$Res> {
  _$ApiConfigStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiEndpoint = null,
    Object? httpAllowed = null,
  }) {
    return _then(_value.copyWith(
      apiEndpoint: null == apiEndpoint
          ? _value.apiEndpoint
          : apiEndpoint // ignore: cast_nullable_to_non_nullable
              as String,
      httpAllowed: null == httpAllowed
          ? _value.httpAllowed
          : httpAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiConfigStateImplCopyWith<$Res>
    implements $ApiConfigStateCopyWith<$Res> {
  factory _$$ApiConfigStateImplCopyWith(_$ApiConfigStateImpl value,
          $Res Function(_$ApiConfigStateImpl) then) =
      __$$ApiConfigStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String apiEndpoint, bool httpAllowed});
}

/// @nodoc
class __$$ApiConfigStateImplCopyWithImpl<$Res>
    extends _$ApiConfigStateCopyWithImpl<$Res, _$ApiConfigStateImpl>
    implements _$$ApiConfigStateImplCopyWith<$Res> {
  __$$ApiConfigStateImplCopyWithImpl(
      _$ApiConfigStateImpl _value, $Res Function(_$ApiConfigStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiEndpoint = null,
    Object? httpAllowed = null,
  }) {
    return _then(_$ApiConfigStateImpl(
      apiEndpoint: null == apiEndpoint
          ? _value.apiEndpoint
          : apiEndpoint // ignore: cast_nullable_to_non_nullable
              as String,
      httpAllowed: null == httpAllowed
          ? _value.httpAllowed
          : httpAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ApiConfigStateImpl extends _ApiConfigState {
  const _$ApiConfigStateImpl(
      {this.apiEndpoint = DefaultApiConfig.apiEndpoint,
      this.httpAllowed = DefaultApiConfig.httpAllowed})
      : super._();

  @override
  @JsonKey()
  final String apiEndpoint;
  @override
  @JsonKey()
  final bool httpAllowed;

  @override
  String toString() {
    return 'ApiConfigState(apiEndpoint: $apiEndpoint, httpAllowed: $httpAllowed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiConfigStateImpl &&
            (identical(other.apiEndpoint, apiEndpoint) ||
                other.apiEndpoint == apiEndpoint) &&
            (identical(other.httpAllowed, httpAllowed) ||
                other.httpAllowed == httpAllowed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiEndpoint, httpAllowed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiConfigStateImplCopyWith<_$ApiConfigStateImpl> get copyWith =>
      __$$ApiConfigStateImplCopyWithImpl<_$ApiConfigStateImpl>(
          this, _$identity);
}

abstract class _ApiConfigState extends ApiConfigState {
  const factory _ApiConfigState(
      {final String apiEndpoint,
      final bool httpAllowed}) = _$ApiConfigStateImpl;
  const _ApiConfigState._() : super._();

  @override
  String get apiEndpoint;
  @override
  bool get httpAllowed;
  @override
  @JsonKey(ignore: true)
  _$$ApiConfigStateImplCopyWith<_$ApiConfigStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
