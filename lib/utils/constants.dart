import 'package:flutter/material.dart';

class AppStrings {
  static const String appName = 'My Awesome App';
  static const String appBarTitle = 'Potato Timer';
  static const String dialogTitle = 'Add Task';
  static const String title = 'Title';
  static const String description = 'Description';
  static const String duration = 'Duration';
  static const String hh = 'HH';
  static const String mm = 'MM';
  static const String ss = 'SS';
  static const String markComplete = 'MARK COMPLETE';
  static const String finished = 'FINISHED';
  static const String fabInfo =
      'No timers active. \nPress here to start a new one';
}

class AppColors {
  static const Color primaryGreenColor = Color(0xff216C2E);
  static const Color secondaryGreenColor = Color(0xffA7F5A7);
  static const Color primaryTealColor = Color(0xff006782);
  static const Color fabBackgroundColor = Color(0xffB6EAFF);
  static const Color dialogBackgroundColor = Color(0xffFBFCFE);
  static const Color primaryGreyColor = Color(0xFF70787D);
  static const Color buttonColor = Color(0xffE1DFFF);
  static const Color shadowColor = Color(0x40000000);
  // Add more colors as needed
}

class RouteTo {
  static const String homeScreen = '/home';
}

class Images {
  static const String appIcon = 'assets/images/appIcon.png';
  static const String appName = 'assets/images/appName.png';
  static const String fabIcon = 'assets/images/iAdd-Line.png';
  static const String pauseIcon = 'assets/images/pause.png';
  static const String playIcon = 'assets/images/play.png';
  static const String stopIcon = 'assets/images/stop.png';
  static const String arrowIcon = 'assets/images/arrow.png';
  static const String soundWaveIcon = 'assets/images/soundwave.png';
}

class Song {
  static const String path = 'song/song.mp3';
}
