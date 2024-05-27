import 'package:flutter/material.dart';
import "index.dart";

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //used to interact with fluter engine layer
  setupLocator();
  runApp(const PotatoTimer());
}

class PotatoTimer extends StatelessWidget {
  const PotatoTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Potato Timer",
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: AppColors.fabBackgroundColor),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const SplashScreen(),
        "/home": (context) => const HomeScreen(),
      },
    );
  }
}
