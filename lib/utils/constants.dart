import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// endpoints
const baseUrl = 'https://api.thingspeak.com';
final path =
    '/channels/${dotenv.env['CHANNEL_ID']}/fields/1.json?api_key=${dotenv.env['API_KEY']!}&results=1';

// routes
const homeScreenRoute = '/homeScreen';
const settingsScreenRoute = '/settingsScreen';

// padding and margin
const extraLargePadding = 128.0;
const veryLargePadding = 64.0;
const largePadding = 32.0;
const padding = 16.0;
const smallPadding = 8.0;
const nil = 0.0;

const hundred = 100;

const lightModeBaseColor = Colors.blue;
const darkModeBaseColor = Color(0xFF121212);

const emptyString = '';
const threeDots = '...';
const percentage = '%';
const exclamation = '!';

const settings = 'Settings';
const darkModeTitle = 'Dark Mode';
const darkModeSubtitle =
    'Turns on/off dark mode. Turn on this setting if you want dark mode throughout the app';
const anErrorOccurred =
    'An error occurred. This may be due to your internet connection. Please try again later';
const liquidLevel = 'Liquid Level';
const liquidLevelMonitoringSystem = 'Liquid Level Monitoring System';
