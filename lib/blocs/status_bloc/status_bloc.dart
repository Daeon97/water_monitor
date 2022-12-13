import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../models/models.dart' as models;
import '../../repositories/repositories.dart' as repositories;

part 'status_event.dart';

part 'status_state.dart';

class StatusBloc extends Bloc<StatusEvent, StatusState> {
  StatusBloc({
    required repositories.DatabaseOpsRepository databaseOpsRepository,
  }) : super(
          const StatusInitialState(),
        ) {
    on<ListenStatusEvent>(
      (event, emit) async {
        emit(
          const GettingStatusState(),
        );
        if (_statusStreamSubscription != null) {
          await _statusStreamSubscription!.cancel();
          _statusStreamSubscription = null;
        }
        _statusStreamSubscription = databaseOpsRepository.status.listen(
          (databaseEvent) {
            add(
              GotStatusEvent(
                models.Status(
                  status: databaseOpsRepository.computeStatus(
                    databaseEvent.snapshot,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
    on<GotStatusEvent>(
      (event, emit) async {
        emit(
          GotStatusState(
            event.status,
          ),
        );
      },
    );
    on<StopListeningStatusEvent>(
      (event, emit) async {
        if (_statusStreamSubscription != null) {
          await _statusStreamSubscription!.cancel();
          _statusStreamSubscription = null;
        }
      },
    );
  }

  StreamSubscription<DatabaseEvent>? _statusStreamSubscription;
}
