import "package:flutter/material.dart";
import "../index.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    if (mounted) {
      Navigator.pushReplacementNamed(context, RouteTo.homeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: MediaQuery.of(context).size.height * .2,
              backgroundImage: const AssetImage(
                Images.appIcon,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Timer Dash",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: const Color.fromARGB(255, 10, 63, 143)),
            )
          ],
        ),
      ),
    );
  }
}
