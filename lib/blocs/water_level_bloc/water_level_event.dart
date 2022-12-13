part of 'water_level_bloc.dart';

abstract class WaterLevelEvent extends Equatable {
  const WaterLevelEvent();

  @override
  List<Object?> get props => [];
}

class ListenWaterLevelEvent extends WaterLevelEvent {
  const ListenWaterLevelEvent();

  @override
  List<Object?> get props => [];
}

class GotWaterLevelEvent extends WaterLevelEvent {
  const GotWaterLevelEvent(
    this.waterLevel,
  );

  final models.WaterLevel waterLevel;

  @override
  List<Object?> get props => [
        waterLevel,
      ];
}

class StopListeningWaterLevelEvent extends WaterLevelEvent {
  const StopListeningWaterLevelEvent();

  @override
  List<Object?> get props => [];
}
