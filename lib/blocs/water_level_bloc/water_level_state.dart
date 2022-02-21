part of 'water_level_bloc.dart';

abstract class WaterLevelState extends Equatable {
  const WaterLevelState();
  
  @override
  List<Object> get props => [];
}

class WaterLevelInitial extends WaterLevelState {}
