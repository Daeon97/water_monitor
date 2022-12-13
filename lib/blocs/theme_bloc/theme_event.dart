part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  const ChangeThemeEvent(
    this.theme,
  );

  final utils.Theme theme;

  @override
  List<Object?> get props => [
        theme,
      ];
}

class GetThemeEvent extends ThemeEvent {
  const GetThemeEvent();

  @override
  List<Object?> get props => [];
}
