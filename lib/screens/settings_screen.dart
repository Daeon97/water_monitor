import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart' as blocs;
import '../utils/utils.dart' as utils;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<blocs.ThemeBloc>(context).add(
      const blocs.GetThemeEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<blocs.ThemeBloc, blocs.ThemeState>(
      builder: (themeContext, themeState) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              utils.settings,
              style: TextStyle(
                color: themeState.themeValue == utils.Theme.dark
                    ? Colors.white
                    : utils.lightModeBaseColor,
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: themeState.themeValue == utils.Theme.dark
                    ? Colors.white
                    : utils.lightModeBaseColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: utils.padding,
                ),
                SwitchListTile(
                  title: themeState.themeValue == utils.Theme.dark
                      ? const Text(
                          utils.darkModeTitle,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          utils.darkModeTitle,
                        ),
                  subtitle: themeState.themeValue == utils.Theme.dark
                      ? const Text(
                          utils.darkModeSubtitle,
                          style: TextStyle(
                            color: Colors.white38,
                          ),
                        )
                      : const Text(
                          utils.darkModeSubtitle,
                        ),
                  value: themeState.themeValue == utils.Theme.dark,
                  onChanged: (value) {
                    themeContext.read<blocs.ThemeBloc>().add(
                          blocs.ChangeThemeEvent(
                            theme: value ? utils.Theme.dark : utils.Theme.light,
                          ),
                        );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
