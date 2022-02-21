part of 'water_level_bloc.dart';

abstract class WaterLevelState extends Equatable {
  const WaterLevelState();

  @override
  List<Object> get props => [];
}

class GettingWaterLevelState extends WaterLevelState {
  const GettingWaterLevelState();

  @override
  List<Object> get props => [];
}

class GotWaterLevelState extends WaterLevelState {
  final models.WaterLevel waterLevel;

  const GotWaterLevelState({required this.waterLevel});

  @override
  List<Object> get props => [];
}

class FailedToGetWaterLevelState extends WaterLevelState {
  const FailedToGetWaterLevelState();

  @override
  List<Object> get props => [];
}
