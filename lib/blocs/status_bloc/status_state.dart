part of 'status_bloc.dart';

abstract class StatusState extends Equatable {
  const StatusState();

  @override
  List<Object?> get props => [];
}

class StatusInitialState extends StatusState {
  const StatusInitialState();

  @override
  List<Object?> get props => [];
}

class GettingStatusState extends StatusState {
  const GettingStatusState();

  @override
  List<Object?> get props => [];
}

class GotStatusState extends StatusState {
  const GotStatusState(
    this.status,
  );

  final models.Status status;

  @override
  List<Object?> get props => [
        status,
      ];
}
