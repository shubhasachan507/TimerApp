import "package:flutter/material.dart";
import "package:potatotimer/widgets/index.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(124),
        child: HomeAppbar(),
      ),
      floatingActionButton: SizedBox(
        height: 78,
        width: 78,
        child: FloatingActionButton(
          backgroundColor: const Color(0xffB6EAFF),
          shape: const CircleBorder(),
          onPressed: () {},
          child: Image.asset("asset/images/iAdd-Line.png"),
        ),
      ),
    );
  }
}
