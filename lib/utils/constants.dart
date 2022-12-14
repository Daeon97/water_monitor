import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// endpoints
const baseUrl = 'https://api.thingspeak.com';
final path =
    '/channels/${dotenv.env['CHANNEL_ID']}/fields/1.json?api_key=${dotenv.env['API_KEY']!}&results=1';

// routes
const homeScreenRoute = '/homeScreen';
const settingsScreenRoute = '/settingsScreen';

// references
const testRef = 'test';

// fields
const floatField = 'float';
const intField = 'int';
// const sliderField = 'slider';
// const statusField = 'status';

// padding and margin
const extraLargePadding = 128.0;
const veryLargePadding = 64.0;
const largePadding = 32.0;
const padding = 16.0;
const smallPadding = 8.0;
const tinyPadding = 2.0;
const veryTinyPadding = 1.0;
const nil = 0.0;

const nilDotTwo = 0.2;
const nilDotFour = 0.4;
const nilDotFive = 0.5;
const hundredDotNil = 100.0;
const threeHundredFiftyDotNil = 350.0;

const measurementBarHeight = 160.0;

const totalTankHeight = 50.0;

const zero = 0;
const one = 1;
const threeThousand = 3000;

const lightModeBaseColor = Colors.blue;
const darkModeBaseColor = Color(0xFF121212);
const measurementBarColor = Color(0xFFD5D5D5);

const waterBarRiveAnimation = 'animations/water_bar.riv';
const waterBarRiveAnimationStateMachineName = 'State Machine';
const waterBarRiveAnimationSMIInputName = 'Level';

const emptyString = '';
const threeDots = '...';
const percentage = '%';
const exclamation = '!';

const zeroPercent = '0%';
const fiftyPercent = '50%';
const hundredPercent = '100%';

const settings = 'Settings';
const darkModeTitle = 'Dark Mode';
const darkModeSubtitle =
    'Turns on/off dark mode. Turn on this setting if you want dark mode throughout the app';
const anErrorOccurred =
    'An error occurred. This may be due to your internet connection. Please try again later';
const liquidLevel = 'Liquid Level';
const liquidLevelMonitoringSystem = 'Liquid Level Monitoring System';
