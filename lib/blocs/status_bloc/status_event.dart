part of 'status_bloc.dart';

abstract class StatusEvent extends Equatable {
  const StatusEvent();

  @override
  List<Object?> get props => [];
}

class ListenStatusEvent extends StatusEvent {
  const ListenStatusEvent();

  @override
  List<Object?> get props => [];
}

class GotStatusEvent extends StatusEvent {
  const GotStatusEvent(
    this.status,
  );

  final models.Status status;

  @override
  List<Object?> get props => [
        status,
      ];
}

class StopListeningStatusEvent extends StatusEvent {
  const StopListeningStatusEvent();

  @override
  List<Object?> get props => [];
}
