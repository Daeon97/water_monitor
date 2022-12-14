import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:shimmer/shimmer.dart';
import '../blocs/blocs.dart' as blocs;
import '../utils/utils.dart' as utils;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SMIInput<double> _waterBarRiveAnimationSMIInput;

  void _onWaterBarRiveAnimationInit(Artboard artboard) {
    final stateMachineController = StateMachineController.fromArtboard(
      artboard,
      utils.waterBarRiveAnimationStateMachineName,
    )!;

    artboard.addController(
      stateMachineController,
    );

    _waterBarRiveAnimationSMIInput = stateMachineController.findInput<double>(
      utils.waterBarRiveAnimationSMIInputName,
    )!;
  }

  @override
  void initState() {
    BlocProvider.of<blocs.ThemeBloc>(context).add(
      const blocs.GetThemeEvent(),
    );
    BlocProvider.of<blocs.WaterLevelBloc>(context).add(
      const blocs.ListenWaterLevelEvent(),
    );
    BlocProvider.of<blocs.StatusBloc>(context).add(
      const blocs.ListenStatusEvent(),
    );
    super.initState();
  }

  @override
  void deactivate() {
    BlocProvider.of<blocs.WaterLevelBloc>(context).add(
      const blocs.StopListeningWaterLevelEvent(),
    );
    BlocProvider.of<blocs.StatusBloc>(context).add(
      const blocs.StopListeningStatusEvent(),
    );
    super.deactivate();
  }

  @override
  void dispose() {
    _waterBarRiveAnimationSMIInput.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<blocs.WaterLevelBloc, blocs.WaterLevelState>(
        listener: (_, waterLevelState) {
          if (waterLevelState is blocs.GotWaterLevelState) {
            _waterBarRiveAnimationSMIInput.value =
                waterLevelState.waterLevel.value;
          }
        },
        child: BlocBuilder<blocs.ThemeBloc, blocs.ThemeState>(
          builder: (_, themeState) => Scaffold(
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
                padding: const EdgeInsets.all(
                  utils.padding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: utils.tinyPadding,
                      child: SizedBox(
                        height: utils.threeHundredFiftyDotNil,
                        child: Stack(
                          alignment: const Alignment(
                            utils.nilDotFour,
                            utils.nil,
                          ),
                          children: [
                            RiveAnimation.asset(
                              utils.waterBarRiveAnimation,
                              onInit: _onWaterBarRiveAnimationInit,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BlocBuilder<blocs.StatusBloc,
                                    blocs.StatusState>(
                                  builder: (_, statusState) => Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(
                                        width: utils.padding,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            color: themeState.themeValue ==
                                                    utils.Theme.dark
                                                ? statusState is blocs
                                                            .GotStatusState &&
                                                        statusState.status
                                                                .status ==
                                                            utils.Status.on
                                                    ? Colors.white
                                                    : Colors.white.withOpacity(
                                                        utils.nilDotTwo,
                                                      )
                                                : statusState is blocs
                                                            .GotStatusState &&
                                                        statusState.status
                                                                .status ==
                                                            utils.Status.on
                                                    ? utils.lightModeBaseColor
                                                    : utils.lightModeBaseColor
                                                        .withOpacity(
                                                        utils.nilDotTwo,
                                                      ),
                                            height: utils.veryTinyPadding,
                                            width: utils.padding,
                                          ),
                                          const SizedBox(
                                            height: utils.padding +
                                                utils.tinyPadding +
                                                utils.veryTinyPadding,
                                          ),
                                          Container(
                                            color: themeState.themeValue ==
                                                    utils.Theme.dark
                                                ? statusState is blocs
                                                            .GotStatusState &&
                                                        statusState.status
                                                                .status ==
                                                            utils.Status.on
                                                    ? Colors.white
                                                    : Colors.white.withOpacity(
                                                        utils.nilDotTwo,
                                                      )
                                                : statusState is blocs
                                                            .GotStatusState &&
                                                        statusState.status
                                                                .status ==
                                                            utils.Status.on
                                                    ? utils.lightModeBaseColor
                                                    : utils.lightModeBaseColor
                                                        .withOpacity(
                                                        utils.nilDotTwo,
                                                      ),
                                            height: utils.veryTinyPadding,
                                            width: utils.smallPadding,
                                          ),
                                          const SizedBox(
                                            height: utils.padding +
                                                utils.tinyPadding +
                                                utils.veryTinyPadding,
                                          ),
                                          Container(
                                            color: themeState.themeValue ==
                                                    utils.Theme.dark
                                                ? statusState is blocs
                                                            .GotStatusState &&
                                                        statusState.status
                                                                .status ==
                                                            utils.Status.on
                                                    ? Colors.white
                                                    : Colors.white.withOpacity(
                                                        utils.nilDotTwo,
                                                      )
                                                : statusState is blocs
                                                            .GotStatusState &&
                                                        statusState.status
                                                                .status ==
                                                            utils.Status.on
                                                    ? utils.lightModeBaseColor
                                                    : utils.lightModeBaseColor
                                                        .withOpacity(
                                                        utils.nilDotTwo,
                                                      ),
                                            height: utils.veryTinyPadding,
                                            width: utils.padding,
                                          ),
                                          const SizedBox(
                                            height: utils.padding +
                                                utils.tinyPadding +
                                                utils.veryTinyPadding,
                                          ),
                                          Container(
                                            color: themeState.themeValue ==
                                                    utils.Theme.dark
                                                ? statusState is blocs
                                                            .GotStatusState &&
                                                        statusState.status
                                                                .status ==
                                                            utils.Status.on
                                                    ? Colors.white
                                                    : Colors.white.withOpacity(
                                                        utils.nilDotTwo,
                                                      )
                                                : statusState is blocs
                                                            .GotStatusState &&
                                                        statusState.status
                                                                .status ==
                                                            utils.Status.on
                                                    ? utils.lightModeBaseColor
                                                    : utils.lightModeBaseColor
                                                        .withOpacity(
                                                        utils.nilDotTwo,
                                                      ),
                                            height: utils.veryTinyPadding,
                                            width: utils.smallPadding,
                                          ),
                                          const SizedBox(
                                            height: utils.padding +
                                                utils.tinyPadding +
                                                utils.veryTinyPadding,
                                          ),
                                          Container(
                                            color: themeState.themeValue ==
                                                    utils.Theme.dark
                                                ? statusState is blocs
                                                            .GotStatusState &&
                                                        statusState.status
                                                                .status ==
                                                            utils.Status.on
                                                    ? Colors.white
                                                    : Colors.white.withOpacity(
                                                        utils.nilDotTwo,
                                                      )
                                                : statusState is blocs
                                                            .GotStatusState &&
                                                        statusState.status
                                                                .status ==
                                                            utils.Status.on
                                                    ? utils.lightModeBaseColor
                                                    : utils.lightModeBaseColor
                                                        .withOpacity(
                                                        utils.nilDotTwo,
                                                      ),
                                            height: utils.veryTinyPadding,
                                            width: utils.padding,
                                          ),
                                          const SizedBox(
                                            height: utils.padding +
                                                utils.tinyPadding +
                                                utils.veryTinyPadding,
                                          ),
                                          Container(
                                            color: themeState.themeValue ==
                                                    utils.Theme.dark
                                                ? statusState is blocs
                                                            .GotStatusState &&
                                                        statusState.status
                                                                .status ==
                                                            utils.Status.on
                                                    ? Colors.white
                                                    : Colors.white.withOpacity(
                                                        utils.nilDotTwo,
                                                      )
                                                : statusState is blocs
                                                            .GotStatusState &&
                                                        statusState.status
                                                                .status ==
                                                            utils.Status.on
                                                    ? utils.lightModeBaseColor
                                                    : utils.lightModeBaseColor
                                                        .withOpacity(
                                                        utils.nilDotTwo,
                                                      ),
                                            height: utils.veryTinyPadding,
                                            width: utils.smallPadding,
                                          ),
                                          const SizedBox(
                                            height: utils.padding +
                                                utils.tinyPadding +
                                                utils.veryTinyPadding,
                                          ),
                                          Container(
                                            color: themeState.themeValue ==
                                                    utils.Theme.dark
                                                ? statusState is blocs
                                                            .GotStatusState &&
                                                        statusState.status
                                                                .status ==
                                                            utils.Status.on
                                                    ? Colors.white
                                                    : Colors.white.withOpacity(
                                                        utils.nilDotTwo,
                                                      )
                                                : statusState is blocs
                                                            .GotStatusState &&
                                                        statusState.status
                                                                .status ==
                                                            utils.Status.on
                                                    ? utils.lightModeBaseColor
                                                    : utils.lightModeBaseColor
                                                        .withOpacity(
                                                        utils.nilDotTwo,
                                                      ),
                                            height: utils.veryTinyPadding,
                                            width: utils.padding,
                                          ),
                                          const SizedBox(
                                            height: utils.padding +
                                                utils.tinyPadding +
                                                utils.veryTinyPadding,
                                          ),
                                          Container(
                                            color: themeState.themeValue ==
                                                    utils.Theme.dark
                                                ? statusState is blocs
                                                            .GotStatusState &&
                                                        statusState.status
                                                                .status ==
                                                            utils.Status.on
                                                    ? Colors.white
                                                    : Colors.white.withOpacity(
                                                        utils.nilDotTwo,
                                                      )
                                                : statusState is blocs
                                                            .GotStatusState &&
                                                        statusState.status
                                                                .status ==
                                                            utils.Status.on
                                                    ? utils.lightModeBaseColor
                                                    : utils.lightModeBaseColor
                                                        .withOpacity(
                                                        utils.nilDotTwo,
                                                      ),
                                            height: utils.veryTinyPadding,
                                            width: utils.smallPadding,
                                          ),
                                          const SizedBox(
                                            height: utils.padding +
                                                utils.tinyPadding +
                                                utils.veryTinyPadding,
                                          ),
                                          Container(
                                            color: themeState.themeValue ==
                                                    utils.Theme.dark
                                                ? statusState is blocs
                                                            .GotStatusState &&
                                                        statusState.status
                                                                .status ==
                                                            utils.Status.on
                                                    ? Colors.white
                                                    : Colors.white.withOpacity(
                                                        utils.nilDotTwo,
                                                      )
                                                : statusState is blocs
                                                            .GotStatusState &&
                                                        statusState.status
                                                                .status ==
                                                            utils.Status.on
                                                    ? utils.lightModeBaseColor
                                                    : utils.lightModeBaseColor
                                                        .withOpacity(
                                                        utils.nilDotTwo,
                                                      ),
                                            height: utils.veryTinyPadding,
                                            width: utils.padding,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        color: themeState.themeValue ==
                                                utils.Theme.dark
                                            ? statusState is blocs
                                                        .GotStatusState &&
                                                    statusState.status.status ==
                                                        utils.Status.on
                                                ? Colors.white
                                                : Colors.white.withOpacity(
                                                    utils.nilDotTwo,
                                                  )
                                            : statusState is blocs
                                                        .GotStatusState &&
                                                    statusState.status.status ==
                                                        utils.Status.on
                                                ? utils.lightModeBaseColor
                                                : utils.lightModeBaseColor
                                                    .withOpacity(
                                                    utils.nilDotTwo,
                                                  ),
                                        height: utils.measurementBarHeight,
                                        width: utils.veryTinyPadding,
                                      ),
                                      const SizedBox(
                                        width: utils.tinyPadding +
                                            utils.tinyPadding,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            utils.hundredPercent,
                                            style: TextStyle(
                                              fontSize: utils.smallPadding,
                                              color: themeState.themeValue ==
                                                      utils.Theme.dark
                                                  ? statusState is blocs
                                                              .GotStatusState &&
                                                          statusState.status
                                                                  .status ==
                                                              utils.Status.on
                                                      ? Colors.white
                                                      : Colors.white
                                                          .withOpacity(
                                                          utils.nilDotTwo,
                                                        )
                                                  : statusState is blocs
                                                              .GotStatusState &&
                                                          statusState.status
                                                                  .status ==
                                                              utils.Status.on
                                                      ? utils.lightModeBaseColor
                                                      : utils.lightModeBaseColor
                                                          .withOpacity(
                                                          utils.nilDotTwo,
                                                        ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: utils.veryLargePadding +
                                                utils.smallPadding,
                                          ),
                                          Text(
                                            utils.fiftyPercent,
                                            style: TextStyle(
                                              fontSize: utils.smallPadding,
                                              color: themeState.themeValue ==
                                                      utils.Theme.dark
                                                  ? statusState is blocs
                                                              .GotStatusState &&
                                                          statusState.status
                                                                  .status ==
                                                              utils.Status.on
                                                      ? Colors.white
                                                      : Colors.white
                                                          .withOpacity(
                                                          utils.nilDotTwo,
                                                        )
                                                  : statusState is blocs
                                                              .GotStatusState &&
                                                          statusState.status
                                                                  .status ==
                                                              utils.Status.on
                                                      ? utils.lightModeBaseColor
                                                      : utils.lightModeBaseColor
                                                          .withOpacity(
                                                          utils.nilDotTwo,
                                                        ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: utils.veryLargePadding +
                                                utils.smallPadding,
                                          ),
                                          Text(
                                            utils.zeroPercent,
                                            style: TextStyle(
                                              fontSize: utils.smallPadding,
                                              color: themeState.themeValue ==
                                                      utils.Theme.dark
                                                  ? statusState is blocs
                                                              .GotStatusState &&
                                                          statusState.status
                                                                  .status ==
                                                              utils.Status.on
                                                      ? Colors.white
                                                      : Colors.white
                                                          .withOpacity(
                                                          utils.nilDotTwo,
                                                        )
                                                  : statusState is blocs
                                                              .GotStatusState &&
                                                          statusState.status
                                                                  .status ==
                                                              utils.Status.on
                                                      ? utils.lightModeBaseColor
                                                      : utils.lightModeBaseColor
                                                          .withOpacity(
                                                          utils.nilDotTwo,
                                                        ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: utils.padding,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    BlocBuilder<blocs.WaterLevelBloc, blocs.WaterLevelState>(
                      builder: (_, waterLevelState) => waterLevelState
                              is blocs.GotWaterLevelState
                          ? BlocBuilder<blocs.StatusBloc, blocs.StatusState>(
                              builder: (_, statusState) => Text(
                                waterLevelState.waterLevel.value.toString() +
                                    utils.percentage,
                                style: TextStyle(
                                  fontSize: utils.largePadding + utils.padding,
                                  color: themeState.themeValue ==
                                          utils.Theme.dark
                                      ? statusState is blocs.GotStatusState &&
                                              statusState.status.status ==
                                                  utils.Status.on
                                          ? Colors.white
                                          : Colors.white.withOpacity(
                                              utils.nilDotTwo,
                                            )
                                      : statusState is blocs.GotStatusState &&
                                              statusState.status.status ==
                                                  utils.Status.on
                                          ? utils.lightModeBaseColor
                                          : utils.lightModeBaseColor
                                              .withOpacity(
                                              utils.nilDotTwo,
                                            ),
                                ),
                              ),
                            )
                          : Shimmer.fromColors(
                              baseColor:
                                  themeState.themeValue == utils.Theme.dark
                                      ? Colors.white
                                      : utils.lightModeBaseColor,
                              highlightColor:
                                  themeState.themeValue == utils.Theme.dark
                                      ? utils.darkModeBaseColor
                                      : Colors.white,
                              child: Container(
                                color: themeState.themeValue == utils.Theme.dark
                                    ? Colors.white
                                    : utils.lightModeBaseColor,
                                child: Text(
                                  utils.zeroPercent,
                                  style: TextStyle(
                                    fontSize:
                                        utils.largePadding + utils.padding,
                                    color: themeState.themeValue ==
                                            utils.Theme.dark
                                        ? Colors.white
                                        : utils.lightModeBaseColor,
                                  ),
                                ),
                              ),
                            ),
                    ),
                    BlocBuilder<blocs.WaterLevelBloc, blocs.WaterLevelState>(
                      builder: (_, waterLevelState) => waterLevelState
                              is blocs.GotWaterLevelState
                          ? BlocBuilder<blocs.StatusBloc, blocs.StatusState>(
                              builder: (_, statusState) => Text(
                                utils.liquidLevel,
                                style: TextStyle(
                                  fontSize: utils.padding + utils.smallPadding,
                                  color: themeState.themeValue ==
                                          utils.Theme.dark
                                      ? statusState is blocs.GotStatusState &&
                                              statusState.status.status ==
                                                  utils.Status.on
                                          ? Colors.white
                                          : Colors.white.withOpacity(
                                              utils.nilDotTwo,
                                            )
                                      : statusState is blocs.GotStatusState &&
                                              statusState.status.status ==
                                                  utils.Status.on
                                          ? utils.lightModeBaseColor
                                          : utils.lightModeBaseColor
                                              .withOpacity(
                                              utils.nilDotTwo,
                                            ),
                                ),
                              ),
                            )
                          : Shimmer.fromColors(
                              baseColor:
                                  themeState.themeValue == utils.Theme.dark
                                      ? Colors.white
                                      : utils.lightModeBaseColor,
                              highlightColor:
                                  themeState.themeValue == utils.Theme.dark
                                      ? utils.darkModeBaseColor
                                      : Colors.white,
                              child: Container(
                                color: themeState.themeValue == utils.Theme.dark
                                    ? Colors.white
                                    : utils.lightModeBaseColor,
                                child: Text(
                                  utils.liquidLevel,
                                  style: TextStyle(
                                    fontSize:
                                        utils.padding + utils.smallPadding,
                                    color: themeState.themeValue ==
                                            utils.Theme.dark
                                        ? Colors.white
                                        : utils.lightModeBaseColor,
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
