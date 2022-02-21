import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'water_level_event.dart';
part 'water_level_state.dart';

class WaterLevelBloc extends Bloc<WaterLevelEvent, WaterLevelState> {
  WaterLevelBloc()
      : super(
          WaterLevelInitial(),
        ) {
    on<WaterLevelEvent>(
      (event, emit) {
        //.
      },
    );
  }
}
