import "package:flutter/material.dart";
import 'package:flutter_mobx/flutter_mobx.dart';
import '../index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final taskStore = getIt<PotatoTimerStore>();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(124),
        child: HomeAppbar(),
      ),
      body: Observer(
        builder: (_) => Stack(
          children: [
            const TaskList(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    if (taskStore.taskList.isEmpty)
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
      ),
    );
  }
}

class TaskList extends StatefulWidget {
  const TaskList({
    super.key,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    final taskStore = getIt<PotatoTimerStore>();
    return Observer(builder: (context) {
      return ListView.builder(
        itemCount: taskStore.taskList.length,
        itemBuilder: (context, index) {
          print(index);
          return TaskCard(
            task: taskStore.taskList[index],
            index: index,
          );
        },
      );
    });
  }
}
