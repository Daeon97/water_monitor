import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/blocs.dart' as blocs;
import 'screens/screens.dart' as screens;
import 'utils/utils.dart' as utils;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _providers,
      child: BlocBuilder<blocs.ThemeBloc, blocs.ThemeState>(
        builder: (themeContext, themeState) {
          return MaterialApp(
            onGenerateRoute: _routes,
            theme: themeState.theme.themeData,
          );
        },
      ),
    );
  }

  List<BlocProvider> get _providers => [];

  Route _routes(RouteSettings settings) => MaterialPageRoute(
        builder: (context) {
          switch (settings.name) {
            case utils.homeScreenRoute:
              return const screens.HomeScreen();
            default:
              return Container();
          }
        },
      );
}