import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
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
    final allTask = taskStore.taskList;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(124),
        child: HomeAppbar(),
      ),
      body: Observer(
        builder: (_) => Stack(
          children: [
            TaskList(allTask: allTask),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    if (allTask.isEmpty) const PressToStartInformation(),
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

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.allTask,
  });

  final ObservableList<Task> allTask;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allTask.length,
      itemBuilder: (context, index) {
        return TaskCard(
          title: allTask[index].title,
          description: allTask[index].description,
          hour: 0,
          minute: 0,
          second: 4,
        );
      },
    );
  }
}
