import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/models.dart' as models;
import '../../repositories/repositories.dart' as repositories;

part 'water_level_event.dart';
part 'water_level_state.dart';

class WaterLevelBloc extends Bloc<WaterLevelEvent, WaterLevelState> {
  WaterLevelBloc({
    required repositories.WaterLevelRepository waterLevelRepository,
  }) : super(
          const GettingWaterLevelState(),
        ) {
    on<GetWaterLevelEvent>(
      (event, emit) async {
        emit(
          const GettingWaterLevelState(),
        );
        try {
          models.WaterLevel waterLevel =
              await waterLevelRepository.getWaterLevel();
          await Future.delayed(
            const Duration(
              seconds: 3,
            ),
          );
          emit(
            GotWaterLevelState(
              waterLevel: waterLevel,
            ),
          );
        } catch (e) {
          emit(
            const FailedToGetWaterLevelState(),
          );
        }
      },
    );
  }
}
