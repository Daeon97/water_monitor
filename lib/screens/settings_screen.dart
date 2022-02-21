import 'package:flutter/material.dart';
import '../utils/utils.dart' as utils;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: utils.baseColor,
        title: const Text(
          utils.settings,
        ),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
