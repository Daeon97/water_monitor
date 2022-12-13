import 'package:freezed_annotation/freezed_annotation.dart';
import '../utils/utils.dart' as utils;

part 'status.freezed.dart';

part 'status.g.dart';

@freezed
class Status with _$Status {
  const factory Status({
    required utils.Status status,
  }) = _Status;

  factory Status.fromJson(Map<String, Object?> json) => _$StatusFromJson(json);
}
