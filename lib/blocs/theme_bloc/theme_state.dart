part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final models.Theme theme;
  final utils.Theme themeValue;

  const ThemeState({
    required this.theme,
    required this.themeValue,
  });

  @override
  List<Object> get props => [
        theme,
      ];
}
