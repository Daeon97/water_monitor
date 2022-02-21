import 'package:flutter/material.dart';
import 'screens/screens.dart' as screens;
import 'utils/utils.dart' as utils;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes,
    );
  }

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
