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
                    size: utils.largePadding + utils.padding,
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
                title: Text(
                  utils.liquidLevelMonitoringSystem,
                  style: TextStyle(
                    color: themeState.themeValue == utils.Theme.dark
                        ? Colors.white
                        : utils.lightModeBaseColor,
                  ),
                ),
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
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                waterLevelState is blocs.GotWaterLevelState
                                    ? (waterLevelState.waterLevel.level)
                                            .toString() +
                                        utils.percentage
                                    : waterLevelState
                                            is blocs.FailedToGetWaterLevelState
                                        ? utils.exclamation
                                        : utils.threeDots,
                                style: TextStyle(
                                  fontSize: utils.extraLargePadding,
                                  color:
                                      themeState.themeValue == utils.Theme.dark
                                          ? Colors.white
                                          : utils.lightModeBaseColor,
                                ),
                              ),
                              waterLevelState is blocs.GotWaterLevelState
                                  ? Text(
                                      utils.liquidLevel,
                                      style: TextStyle(
                                        fontSize:
                                            utils.padding + utils.smallPadding,
                                        color: themeState.themeValue ==
                                                utils.Theme.dark
                                            ? Colors.white
                                            : utils.lightModeBaseColor,
                                      ),
                                    )
                                  : const SizedBox(
                                      width: utils.nil,
                                      height: utils.nil,
                                    ),
                            ],
                          ),
                          SizedBox(
                            width: utils.extraLargePadding +
                                utils.extraLargePadding +
                                utils.veryLargePadding,
                            height: utils.extraLargePadding +
                                utils.extraLargePadding +
                                utils.veryLargePadding,
                            child: CircularProgressIndicator(
                              value: waterLevelState is blocs.GotWaterLevelState
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
                      const SizedBox(
                        height: utils.largePadding,
                      ),
                      IconButton(
                        splashRadius: utils.veryLargePadding,
                        icon: Icon(
                          Icons.refresh,
                          size: utils.largePadding + utils.padding,
                          color: themeState.themeValue == utils.Theme.dark
                              ? Colors.white
                              : utils.lightModeBaseColor,
                        ),
                        onPressed: () {
                          BlocProvider.of<blocs.WaterLevelBloc>(context).add(
                            const blocs.GetWaterLevelEvent(),
                          );
                        },
                      )
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
