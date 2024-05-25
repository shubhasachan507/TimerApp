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
      body: Stack(
        children: [
          const TaskCard(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const PressToStartInformation(),
                  const SizedBox(height: 8.0),
                  CustomFloatingActionButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const NewTaskDialog();
                          });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
