part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  final utils.Theme theme;

  const ChangeThemeEvent({required this.theme});

  @override
  List<Object> get props => [
        theme,
      ];
}

class GetThemeEvent extends ThemeEvent {
  const GetThemeEvent();

  @override
  List<Object> get props => [];
}
