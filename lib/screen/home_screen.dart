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
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(124),
        child: HomeAppbar(title: AppStrings.appBarTitle),
      ),
      body: Observer(
        builder: (_) => Stack(
          children: [
            if (taskStore.taskList.value.isNotEmpty) const TaskList(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    if (taskStore.taskList.value.isEmpty)
                      const PressToStartInformation(),
                    const SizedBox(height: 8.0),
                    CustomFloatingActionButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25))),
                            isDismissible: true,
                            backgroundColor: AppColors.dialogBackgroundColor,
                            clipBehavior: Clip.hardEdge,
                            context: context,
                            builder: (BuildContext context) {
                              return DraggableScrollableSheet(
                                  initialChildSize: 0.75,
                                  minChildSize: 0.25,
                                  maxChildSize: 0.75,
                                  expand: false,
                                  builder: (context, _) => Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: const NewTaskDialog(),
                                      ));
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
  final taskStore = getIt<PotatoTimerStore>();

  @override
  void initState() {
    taskStore.startTimer();
    super.initState();
  }

  @override
  void dispose() {
    taskStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return ListView.builder(
        itemCount: taskStore.taskList.value.length,
        itemBuilder: (context, index) {
          return TaskCard(
            task: taskStore.taskList.value[index],
            index: index,
          );
        },
      );
    });
  }
}
