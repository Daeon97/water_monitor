import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/models.dart' as models;
import '../../utils/utils.dart' as utils;

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          ThemeState(
            theme: models.Theme.fromMode(
              theme: utils.Theme.light,
            ),
          ),
        ) {
    on<ChangeThemeEvent>(
      (event, emit) {
        emit(
          ThemeState(
            theme: models.Theme.fromMode(
              theme: event.theme,
            ),
          ),
        );
      },
    );
  }
}
