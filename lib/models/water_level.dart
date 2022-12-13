import 'package:freezed_annotation/freezed_annotation.dart';

part 'water_level.freezed.dart';

part 'water_level.g.dart';

@freezed
class WaterLevel with _$WaterLevel {
  const factory WaterLevel({
    required double value,
  }) = _WaterLevel;

  factory WaterLevel.fromJson(Map<String, Object?> json) =>
      _$WaterLevelFromJson(json);
}
