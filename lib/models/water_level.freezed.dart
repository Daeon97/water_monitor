// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'water_level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WaterLevel _$WaterLevelFromJson(Map<String, dynamic> json) {
  return _WaterLevel.fromJson(json);
}

/// @nodoc
mixin _$WaterLevel {
  double get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WaterLevelCopyWith<WaterLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaterLevelCopyWith<$Res> {
  factory $WaterLevelCopyWith(
          WaterLevel value, $Res Function(WaterLevel) then) =
      _$WaterLevelCopyWithImpl<$Res, WaterLevel>;
  @useResult
  $Res call({double value});
}

/// @nodoc
class _$WaterLevelCopyWithImpl<$Res, $Val extends WaterLevel>
    implements $WaterLevelCopyWith<$Res> {
  _$WaterLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WaterLevelCopyWith<$Res>
    implements $WaterLevelCopyWith<$Res> {
  factory _$$_WaterLevelCopyWith(
          _$_WaterLevel value, $Res Function(_$_WaterLevel) then) =
      __$$_WaterLevelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double value});
}

/// @nodoc
class __$$_WaterLevelCopyWithImpl<$Res>
    extends _$WaterLevelCopyWithImpl<$Res, _$_WaterLevel>
    implements _$$_WaterLevelCopyWith<$Res> {
  __$$_WaterLevelCopyWithImpl(
      _$_WaterLevel _value, $Res Function(_$_WaterLevel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_WaterLevel(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WaterLevel implements _WaterLevel {
  const _$_WaterLevel({required this.value});

  factory _$_WaterLevel.fromJson(Map<String, dynamic> json) =>
      _$$_WaterLevelFromJson(json);

  @override
  final double value;

  @override
  String toString() {
    return 'WaterLevel(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WaterLevel &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WaterLevelCopyWith<_$_WaterLevel> get copyWith =>
      __$$_WaterLevelCopyWithImpl<_$_WaterLevel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WaterLevelToJson(
      this,
    );
  }
}

abstract class _WaterLevel implements WaterLevel {
  const factory _WaterLevel({required final double value}) = _$_WaterLevel;

  factory _WaterLevel.fromJson(Map<String, dynamic> json) =
      _$_WaterLevel.fromJson;

  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$_WaterLevelCopyWith<_$_WaterLevel> get copyWith =>
      throw _privateConstructorUsedError;
}
