part of 'water_level_bloc.dart';

abstract class WaterLevelState extends Equatable {
  const WaterLevelState();

  @override
  List<Object?> get props => [];
}

class GettingWaterLevelState extends WaterLevelState {
  const GettingWaterLevelState();

  @override
  List<Object?> get props => [];
}

class GotWaterLevelState extends WaterLevelState {
  const GotWaterLevelState(
    this.waterLevel,
  );

  final models.WaterLevel waterLevel;

  @override
  List<Object?> get props => [
        waterLevel,
      ];
}
