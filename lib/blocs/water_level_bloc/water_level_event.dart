part of 'water_level_bloc.dart';

abstract class WaterLevelEvent extends Equatable {
  const WaterLevelEvent();

  @override
  List<Object> get props => [];
}

class GetWaterLevelEvent extends WaterLevelEvent {
  const GetWaterLevelEvent();

  @override
  List<Object> get props => [];
}
