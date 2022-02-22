import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart' as blocs;
import '../utils/utils.dart' as utils;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<blocs.ThemeBloc>(context).add(
      const blocs.GetThemeEvent(),
    );
    BlocProvider.of<blocs.WaterLevelBloc>(context).add(
      const blocs.GetWaterLevelEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<blocs.WaterLevelBloc, blocs.WaterLevelState>(
      listener: (waterLevelContext, waterLevelState) {
        if (waterLevelState is blocs.FailedToGetWaterLevelState) {
          showModalBottomSheet(
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(
                utils.padding,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.warning,
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: utils.padding,
                  ),
                  Text(
                    utils.anErrorOccurred,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: utils.padding,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
      child: BlocBuilder<blocs.ThemeBloc, blocs.ThemeState>(
        builder: (themeContext, themeState) {
          return BlocBuilder<blocs.WaterLevelBloc, blocs.WaterLevelState>(
            builder: (waterLevelContext, waterLevelState) => Scaffold(
              appBar: AppBar(
                title: const FlutterLogo(),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.settings,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        utils.settingsScreenRoute,
                      );
                    },
                  ),
                ],
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      waterLevelState is blocs.FailedToGetWaterLevelState
                          ? IconButton(
                              icon: Icon(
                                Icons.refresh,
                                size: utils.largePadding + utils.padding,
                                color: themeState.themeValue == utils.Theme.dark
                                    ? Colors.white
                                    : utils.lightModeBaseColor,
                              ),
                              onPressed: () {
                                BlocProvider.of<blocs.WaterLevelBloc>(context)
                                    .add(
                                  const blocs.GetWaterLevelEvent(),
                                );
                              },
                            )
                          : Text(
                              waterLevelState is blocs.GotWaterLevelState
                                  ? (waterLevelState.waterLevel.level)
                                          .toString() +
                                      utils.percentage
                                  : utils.threeDots,
                              style: TextStyle(
                                fontSize: utils.extraLargePadding,
                                color: themeState.themeValue == utils.Theme.dark
                                    ? Colors.white
                                    : utils.lightModeBaseColor,
                              ),
                            ),
                      waterLevelState is blocs.GettingWaterLevelState
                          ? SizedBox(
                              width: utils.extraLargePadding +
                                  utils.extraLargePadding +
                                  utils.veryLargePadding,
                              height: utils.extraLargePadding +
                                  utils.extraLargePadding +
                                  utils.veryLargePadding,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  themeState.themeValue == utils.Theme.dark
                                      ? Colors.white
                                      : utils.lightModeBaseColor,
                                ),
                              ),
                            )
                          : SizedBox(
                              width: utils.extraLargePadding +
                                  utils.extraLargePadding +
                                  utils.veryLargePadding,
                              height: utils.extraLargePadding +
                                  utils.extraLargePadding +
                                  utils.veryLargePadding,
                              child: CircularProgressIndicator(
                                value: waterLevelState
                                        is blocs.GotWaterLevelState
                                    ? (waterLevelState.waterLevel.level
                                            .toDouble() /
                                        utils.hundred.toDouble())
                                    : waterLevelState
                                            is blocs.FailedToGetWaterLevelState
                                        ? utils.hundred.toDouble()
                                        : null,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  themeState.themeValue == utils.Theme.dark
                                      ? Colors.white
                                      : utils.lightModeBaseColor,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
