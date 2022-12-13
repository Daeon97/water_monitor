part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState({
    required this.theme,
    required this.themeValue,
  });

  final models.Theme theme;
  final utils.Theme themeValue;

  @override
  List<Object?> get props => [
        theme,
        themeValue,
      ];
}
