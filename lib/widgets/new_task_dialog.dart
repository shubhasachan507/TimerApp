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
  final _hourController = TextEditingController();
  final _minuteController = TextEditingController();
  final _secondController = TextEditingController();
  final taskStore = getIt<PotatoTimerStore>();
  final GlobalKey<FormState> _form1Key = GlobalKey<FormState>();

  void _addTask() {
    final title = _titleController.text;
    final description = _descriptionController.text;
    final hour = _hourController.text;
    final minute = _minuteController.text;
    final second = _secondController.text;

    if (_form1Key.currentState!.validate()) {
      taskStore.addTask(title, description, int.parse(hour), int.parse(minute),
          int.parse(second));
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
      backgroundColor: AppColors.dialogBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(AppStrings.dialogTitle,
                    style: Theme.of(context).textTheme.headlineLarge),
              ),
              const SizedBox(height: 15),
              Form(
                  key: _form1Key,
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: _titleController,
                          title: AppStrings.title),
                      const SizedBox(height: 30),
                      CustomTextField(
                        controller: _descriptionController,
                        title: AppStrings.description,
                        maxLines: 5,
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SetTaskDuration(
                          hourController: _hourController,
                          minuteController: _minuteController,
                          secondController: _secondController,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: _addTask,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                  ),
                  height: 61,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      AppStrings.dialogTitle,
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
