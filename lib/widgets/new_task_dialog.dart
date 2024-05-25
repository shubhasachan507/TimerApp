import "package:flutter/material.dart";
import '../index.dart';

class NewTaskDialog extends StatefulWidget {
  const NewTaskDialog({
    super.key,
  });

  @override
  State<NewTaskDialog> createState() => _NewTaskDialogState();
}

class _NewTaskDialogState extends State<NewTaskDialog> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final taskStore = getIt<PotatoTimerStore>();
  final GlobalKey<FormState> _form1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _form2Key = GlobalKey<FormState>();

  void _addTask() {
    final title = _titleController.text;
    final description = _descriptionController.text;

    if (_form1Key.currentState!.validate()) {
      taskStore.addTask(title, description, 0, 0, 0);
      _titleController.clear();
      _descriptionController.clear();
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xffFBFCFE),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Add Task",
                    style: Theme.of(context).textTheme.headlineLarge),
              ),
              const SizedBox(height: 15),
              Form(
                  key: _form1Key,
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: _titleController, title: "Title"),
                      const SizedBox(height: 30),
                      CustomTextField(
                        controller: _descriptionController,
                        title: "Description",
                        maxLines: 5,
                      ),
                    ],
                  )),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: SetTaskDuration(),
              ),
              const SizedBox(height: 80),
              GestureDetector(
                onTap: _addTask,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffE1DFFF),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                  ),
                  height: 61,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Add Task",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
