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
    BlocProvider.of<blocs.WaterLevelBloc>(context).add(
      const blocs.GetWaterLevelEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<blocs.WaterLevelBloc, blocs.WaterLevelState>(
      listener: (waterLevelContext, waterLevelState) {
        //.
      },
      child: BlocBuilder<blocs.WaterLevelBloc, blocs.WaterLevelState>(
        builder: (waterLevelContext, waterLevelState) => Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.settings,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Text(
                    '123',
                    style: TextStyle(
                      fontSize: utils.extraLargePadding,
                    ),
                  ),
                  const SizedBox(
                    width: utils.extraLargePadding +
                        utils.extraLargePadding +
                        utils.veryLargePadding,
                    height: utils.extraLargePadding +
                        utils.extraLargePadding +
                        utils.veryLargePadding,
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
