import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../models/models.dart' as models;
import '../../repositories/repositories.dart' as repositories;
import '../../utils/utils.dart' as utils;

part 'water_level_event.dart';

part 'water_level_state.dart';

class WaterLevelBloc extends Bloc<WaterLevelEvent, WaterLevelState> {
  WaterLevelBloc({
    required repositories.DatabaseOpsRepository databaseOpsRepository,
  }) : super(
          const GettingWaterLevelState(),
        ) {
    on<ListenWaterLevelEvent>(
      (event, emit) async {
        emit(
          const GettingWaterLevelState(),
        );
        if (_waterLevelStreamSubscription != null) {
          await _waterLevelStreamSubscription!.cancel();
          _waterLevelStreamSubscription = null;
        }
        _waterLevelStreamSubscription = databaseOpsRepository.waterLevel.listen(
          (databaseEvent) {
            final valueFromDatabase = databaseEvent.snapshot.value as double;
            final emptyValue = valueFromDatabase > utils.totalTankHeight
                ? utils.totalTankHeight
                : valueFromDatabase < utils.nil
                    ? utils.nil
                    : valueFromDatabase;
            final waterLevelValue = double.parse(
              (((utils.totalTankHeight - emptyValue) / utils.totalTankHeight) *
                      utils.hundredDotNil)
                  .toStringAsFixed(
                utils.tinyPadding.toInt(),
              ),
            );
            add(
              GotWaterLevelEvent(
                models.WaterLevel(
                  value: waterLevelValue,
                ),
              ),
            );
          },
        );
      },
    );
    on<GotWaterLevelEvent>(
      (event, emit) async {
        emit(
          GotWaterLevelState(
            event.waterLevel,
          ),
        );
      },
    );
    on<StopListeningWaterLevelEvent>(
      (event, emit) async {
        if (_waterLevelStreamSubscription != null) {
          await _waterLevelStreamSubscription!.cancel();
          _waterLevelStreamSubscription = null;
        }
      },
    );
  }

  StreamSubscription<DatabaseEvent>? _waterLevelStreamSubscription;
}
